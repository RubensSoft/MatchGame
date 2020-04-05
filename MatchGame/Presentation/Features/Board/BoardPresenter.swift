import Foundation

protocol BoardPresenter {
    func setupView(_ view: BoardView)
    func viewDidLoad()
    
    func checkCards(firstCard: Card, secondCard: Card)
}

class BoardPresenterImplementation: BoardPresenter {
    private weak var view: BoardView?
    private let router: BoardRouter
    private let getCardsUseCase: GetCardsUseCase?
    private let checkMatchUseCase: CheckMatchUseCase?
    
    init(getCardUseCase: GetCardsUseCase, checkMatchUseCase: CheckMatchUseCase, router: BoardRouter) {
        self.getCardsUseCase = getCardUseCase
        self.checkMatchUseCase = checkMatchUseCase
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
    
    func checkCards(firstCard: Card, secondCard: Card) {
        checkMatchUseCase?.execute(firsCard: firstCard, secondCard: secondCard, completion: { (isMatch) in
            
            if isMatch {
                self.view?.showMatchCards()
            } else {
                self.view?.showNotMatchCards()
            }
            
            self.view?.resetValuesForTheNextFlip()
            
        }, failure: { (error) in
            self.view?.showError(error: error)
        })
    }
    
}


