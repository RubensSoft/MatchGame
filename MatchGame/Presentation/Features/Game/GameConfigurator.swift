import Foundation

class GameConfigurator {
    func configure(controller: GameViewController){
        //let useCase
        let router = GameRouter(controller: controller)
        
        controller.presenter = GamePresenterImplementation(router: router)
    }
}
