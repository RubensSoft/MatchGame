import UIKit

protocol BoardView: class {
    func showError(error: String)
    func showCards(cards: [Card])
    
    func hideCards()
}

class BoardViewController: UIViewController {
    
    let configurator = BoardConfigurator()
    var presenter: BoardPresenter?
    
    let cellIdentifier = "CardCollectionViewCell"
    var cards: [Card] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var indexFirstCard: Int = -1
    var indexSecondCard: Int = -1
    
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
    
    private func setIndexCard(index: Int) {
        if indexFirstCard == -1 {
            indexFirstCard = index
        } else {
            indexSecondCard = index
        }
    }
    
    private func resetIndexCards() {
        indexFirstCard = -1
        indexSecondCard = -1
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
    
    func hideCards() {
        hideCard(idCard: indexFirstCard)
        hideCard(idCard: indexSecondCard)
        resetIndexCards()
    }
    
    func hideCard(idCard: Int) {
        let index = IndexPath.init(item: indexFirstCard, section: 0)
        let cell = collectionView.cellForItem(at: index) as! CardCollectionViewCell
        setVisibleBackCard(cell: cell)
    }
    
    private func createCellWithCard(cell: CardCollectionViewCell, card: Card) -> CardCollectionViewCell {
        let imageName = "\(card.name)"
        let image = UIImage(named: imageName)
        cell.image.image = image
        setVisibleBackCard(cell: cell)
        return cell
    }
    
    private func setVisibleBackCard(cell: CardCollectionViewCell){
        
        
        UIView.animate(withDuration: 3.0,
                       delay: 2.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        cell.backgroundImage.isHidden = false
                        cell.backgroundFrontImage.isHidden = true
                        cell.image.isHidden = true
        },
                       completion: { finished in
                        print("Bug moved right!")
        })
        
    }
    
    private func setVisibleFrontCard(cell: CardCollectionViewCell){
        
        UIView.animate(withDuration: 1.0,
                       delay: 2.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                          cell.backgroundImage.isHidden = true
                              cell.backgroundFrontImage.isHidden = false
                              cell.image.isHidden = false
        },
                       completion: { finished in
                        print("Bug moved right!")
        })
        
      
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
        return createCellWithCard(cell: cell, card: card)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        setVisibleFrontCard(cell: cell)
        
        self.setIndexCard(index: indexPath.row)
        presenter?.tapOnACard(idCard: cards[indexPath.row].id)
    }
}
