import UIKit

protocol LoginView: class {
    func showError(error: String)
}

class LoginViewController: UIViewController {
    let configurator = LoginConfigurator()
    var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        configurator.configure(controller: self)
        presenter?.viewDidLoad()
    }
}

extension LoginViewController: LoginView {
    func showError(error: String) {
        print("Error: \(error)")
    }
    
    
}
