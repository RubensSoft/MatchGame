import UIKit


class LoginRouter {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func goToGameScreen(){
        let navigation = controller.navigationController
        let gameScreen = GameViewController()
    
        navigation?.pushViewController(gameScreen, animated: true)
    }
}
