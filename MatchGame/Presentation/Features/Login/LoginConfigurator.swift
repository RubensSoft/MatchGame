import Foundation

class LoginConfigurator {
    func configure(controller: LoginViewController){
        //let useCase
        let router = LoginRouter(controller: controller)
        controller.presenter = LoginPresenterImplementation(router: router)
        
    }
}
