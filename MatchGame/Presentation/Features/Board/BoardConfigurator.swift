import Foundation

class BoardConfigurator {
    func configure(controller: BoardViewController){
        let useCase = GetCardsUseCaseImplementation()
        let router = BoardRouter(controller: controller)
        
        controller.presenter = BoardPresenterImplementation(cardUseCase: useCase, router: router)
    }
}
