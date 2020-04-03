import UIKit

protocol GameView: class {
    func showError(error: String)
    func showCards(cards: [Card])
}

class GameViewController: UIViewController {
    
    let configurator = GameConfigurator()
    var presenter: GamePresenter?
    
    let cellIdentifier = "CardCollectionViewCell"
    var cards: [Card] = []
    
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

extension GameViewController: GameView {
    func showError(error: String) {
        print("Error: \(error)")
    }
    
    func showCards(cards: [Card]) {
        self.cards = cards
        collectionView.reloadData()
    }
    
    private func createCellWithCard(cell: CardCollectionViewCell, card: Card) -> CardCollectionViewCell {
        let imageName = "\(card.name)"
        let image = UIImage(named: imageName)
        cell.image.image = image
        setVisibleBackCard(cell: cell)
        return cell
    }
    
    private func setVisibleBackCard(cell: CardCollectionViewCell){
        cell.backgroundImage.isHidden = false
        cell.backgroundFrontImage.isHidden = true
        cell.image.isHidden = true
    }
    
    private func setVisibleFrontCard(cell: CardCollectionViewCell){
        cell.backgroundImage.isHidden = true
        cell.backgroundFrontImage.isHidden = false
        cell.image.isHidden = false
    }
    
}


extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    }
}
