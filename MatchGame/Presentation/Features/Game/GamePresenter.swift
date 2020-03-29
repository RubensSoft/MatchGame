import Foundation

protocol GamePresenter {
    func viewDidLoad()
}

class GamePresenterImplementation: GamePresenter {
    
    private weak var view: GameView?
    private let router: GameRouter
    //private let useCase: GetCardsUseCase?
    
    init(router: GameRouter) {
        self.router = router
    }
    
    func viewDidLoad() {
        //call usecase
    }
}
