import UIKit

protocol GameView: class {
    func showError(error: String)
}

class GameViewController: UIViewController {
    let configurator = GameConfigurator()
    var presenter: GamePresenter?
    
    override func viewDidLoad() {
        configurator.configure(controller: self)
        
        print("game screen")
    }
}

extension GameViewController: GameView {
    func showError(error: String) {
        print("Error: \(error)")
    }
    
    
}
