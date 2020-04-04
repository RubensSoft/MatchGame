import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backgroundFrontImage: UIImageView!
    @IBOutlet weak var image: UIImageView!
    
    var isFront = false
    
    override func awakeFromNib() {
        super.awakeFromNib()

        image.isHidden = true
    }
    
    func flip() {
        if isFront {
            flipBack()
            isFront = false
        } else {
            flipFront()
            isFront = true
        }
    }
    
    func flipFront() {
        self.image.isHidden = false
        UIView.transition(from: backgroundImage, to: backgroundFrontImage, duration: 0.4, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack() {
        self.image.isHidden = true
        UIView.transition(from: backgroundFrontImage, to: backgroundImage, duration: 0.4, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
    }
    
}
