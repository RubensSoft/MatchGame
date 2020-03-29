import Foundation

protocol LoginPresenter {
    func viewDidLoad()
}

class LoginPresenterImplementation: LoginPresenter {
    
    private weak var view: LoginView?
    private let router: LoginRouter
    //private let useCase: LoginUseCase?
    
    init(router: LoginRouter) {
        //self.useCase =
        self.router = router
    }
    
    func viewDidLoad() {
        // call to usecase
        router.goToGameScreen()
    }
    
}
