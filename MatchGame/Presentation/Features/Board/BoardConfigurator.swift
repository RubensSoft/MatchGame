import Foundation

class BoardConfigurator {
    func configure(controller: BoardViewController){
        let getCarsdUseCase = GetCardsUseCaseImplementation()
        let tapOnACardUseCase = TapOnACardUseCaseImplementation()
        let router = BoardRouter(controller: controller)
        
        controller.presenter = BoardPresenterImplementation(getCardUseCase: getCarsdUseCase, tapOnACardUseCase: tapOnACardUseCase, router: router)
    }
}
