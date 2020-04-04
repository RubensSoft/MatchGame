import UIKit

protocol BoardView: class {
    func showError(error: String)
    func showCards(cards: [Card])
}

class BoardViewController: UIViewController {
    
    let configurator = BoardConfigurator()
    var presenter: BoardPresenter?
    
    let cellIdentifier = "CardCollectionViewCell"
    var cards: [Card] = []
    var indexFirstCard: IndexPath?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        configurator.configure(controller: self)
        presenter?.setupView(self)
        
        registerCell()
        setSizeItemsCollectionView()
        
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func registerCell(){
        let nibCell = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView?.register(nibCell, forCellWithReuseIdentifier: cellIdentifier)
    }
}

extension BoardViewController: BoardView {
    func showError(error: String) {
        print("Error: \(error)")
    }
    
    func showCards(cards: [Card]) {
        self.cards = cards
        collectionView.reloadData()
    }
}


extension BoardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setSizeItemsCollectionView() {
        var widthItemSize = UIScreen.main.bounds.width/2.25
        var heightItemSize = UIScreen.main.bounds.height/4
        
        var isLandscape: Bool {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        }
        
        if isLandscape {
            widthItemSize = UIScreen.main.bounds.width/4.5
            heightItemSize = UIScreen.main.bounds.height/2
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: widthItemSize, height: heightItemSize)
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 3
        collectionView?.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CardCollectionViewCell
        let card = cards[indexPath.row]
        
        cell.setCard(card: card)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        if !cards[indexPath.row].isFlipped && !cards[indexPath.row].isMatch {
            cell.flipFront()
            cards[indexPath.row].isFlipped = true
            
            if indexFirstCard == nil {
                indexFirstCard = indexPath
            } else {
                checkMatch(indexPath)
            }
        }
        
        //        self.setIndexCard(index: indexPath.row)
        //        presenter?.tapOnACard(idCard: cards[indexPath.row].id)
    }
    
    func checkMatch(_ indexSecondCard: IndexPath) {
        let cardCellOne = collectionView.cellForItem(at: indexFirstCard!) as? CardCollectionViewCell
        let cardCellTwo = collectionView.cellForItem(at: indexSecondCard) as? CardCollectionViewCell
        var cardOne = self.cards[indexFirstCard!.row]
        var cardTwo = self.cards[indexSecondCard.row]
        
        if cardOne.id == cardTwo.id {
            cards[indexFirstCard!.row].isMatch = true
            cards[indexSecondCard.row].isMatch = true
            cardCellOne?.remove()
            cardCellTwo?.remove()
        } else {
            cards[indexFirstCard!.row].isFlipped = false
            cards[indexSecondCard.row].isFlipped = false
            cardCellOne?.flipBack()
            cardCellTwo?.flipBack()
        }
        
        if cardCellOne == nil {
            collectionView.reloadItems(at: [indexFirstCard!])
        }
        
        indexFirstCard = nil
    }
}
