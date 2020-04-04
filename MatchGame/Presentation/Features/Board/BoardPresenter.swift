import Foundation

protocol BoardPresenter {
    func setupView(_ view: BoardView)
    func viewDidLoad()
}

class BoardPresenterImplementation: BoardPresenter {
    private weak var view: BoardView?
    private let router: BoardRouter
    private let getCardsUseCase: GetCardsUseCase?
    
    private var idFirstCard: Int = -1
    private var idSecondCard: Int = -1
    
    init(cardUseCase: GetCardsUseCase, router: BoardRouter) {
        self.getCardsUseCase = cardUseCase
        self.router = router
    }
    
    func setupView(_ view: BoardView) {
        self.view = view
    }
    
    func viewDidLoad() {
        getCardsUseCase?.execute(completion: { (cards) in
            var cardListWithPairs = self.createCardListWithPairs(cards: cards)
            cardListWithPairs.shuffle()
            
            self.view?.showCards(cards: cardListWithPairs)
        }, failure: { (error) in
            self.view?.showError(error: error)
        })
    }
    
    private func createCardListWithPairs(cards: [Card]) -> [Card] {
        var cardListWithPairs: [Card] = []
        for item in cards {
            cardListWithPairs.append(item)
            cardListWithPairs.append(item)
        }
        return cardListWithPairs
    }
    
}


