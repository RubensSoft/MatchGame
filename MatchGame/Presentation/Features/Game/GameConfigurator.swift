import Foundation

class GameConfigurator {
    func configure(controller: GameViewController){
        let useCase = GetCardsUseCaseImplementation()
        let router = GameRouter(controller: controller)
        
        controller.presenter = GamePresenterImplementation(cardUseCase: useCase, router: router)
    }
}
