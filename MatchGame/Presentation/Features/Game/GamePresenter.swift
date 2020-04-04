import Foundation

protocol GamePresenter {
    func setupView(_ view: GameView)
    func viewDidLoad()
    
    func tapOnACard(idCard: Int)
}

class GamePresenterImplementation: GamePresenter {
    private weak var view: GameView?
    private let router: GameRouter
    private let getCardsUseCase: GetCardsUseCase?
    
    private var idFirstCard: Int = -1
    private var idSecondCard: Int = -1
    
    init(cardUseCase: GetCardsUseCase, router: GameRouter) {
        self.getCardsUseCase = cardUseCase
        self.router = router
    }
    
    func setupView(_ view: GameView) {
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
    
    func tapOnACard(idCard: Int) {
        if idFirstCard == -1 {
            idFirstCard = idCard
        } else {
            idSecondCard = idCard
        
        
            
        }
        
    }
    
}


