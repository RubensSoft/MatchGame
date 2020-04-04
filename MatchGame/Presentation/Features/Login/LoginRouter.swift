import UIKit


class LoginRouter {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func goToGameScreen(){
        let navigation = controller.navigationController
        let gameScreen = BoardViewController()
    
        navigation?.pushViewController(gameScreen, animated: true)
    }
}
