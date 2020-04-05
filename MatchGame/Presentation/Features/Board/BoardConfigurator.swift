import Foundation

class BoardConfigurator {
    func configure(controller: BoardViewController){
        let getCarsdUseCase = GetCardsUseCaseImplementation()
        let checkMatchUseCase = CheckMatchUseCaseImplementation()
        let router = BoardRouter(controller: controller)
        
        controller.presenter = BoardPresenterImplementation(getCardUseCase: getCarsdUseCase, checkMatchUseCase: checkMatchUseCase, router: router)
    }
}
