import UIKit

protocol GameView: class {
    func showError(error: String)
    func showCards()
}

class GameViewController: UIViewController {
    
    let configurator = GameConfigurator()
    var presenter: GamePresenter?
    
    let cellIdentifier = "CardCollectionViewCell"
    var cards: [Int] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func showCards() {
        for i in 1...16 {
            cards.append(i)
        }
        collectionView.reloadData()
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        presenter?.goToProductDetailScreen(product: products[indexPath.row])
        print("\(indexPath.row)")
    }
    
}
