import Foundation

protocol GamePresenter {
    func setupView(_ view: GameView)
    func viewDidLoad()
}

class GamePresenterImplementation: GamePresenter {
 
    private weak var view: GameView?
    private let router: GameRouter
    //private let useCase: GetCardsUseCase?
    
    init(router: GameRouter) {
        self.router = router
    }
    
    func setupView(_ view: GameView) {
        self.view = view
     }
    
    func viewDidLoad() {
        //call usecase
        //view?.showCards(numberLeftCard: Int.random(in: 1...15), numberRightCard: Int.random(in: 1...15))
        view?.showCards()
    }
}
