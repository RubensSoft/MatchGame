import UIKit

class CountDownView: UIView {
    
     // MARK: - This initializer will calling from code
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInitialization()
    }
    
    // MARK: - This initializer will calling from XIB
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInitialization()
    }
    
    func commonInitialization(){
        //let view = UINib(nibName: "CountDownView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! UIView
        let view = Bundle.main.loadNibNamed("CountDownView", owner: nil, options: nil)!.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    
    
}
