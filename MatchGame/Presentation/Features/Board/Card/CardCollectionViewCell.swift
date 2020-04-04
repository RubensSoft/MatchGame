import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backgroundFrontImage: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.isHidden = true
    }
    
    func setCard(card: Card) {
        self.imageView.image = UIImage(named: "\(card.name)")
        
        if card.isFlipped {
            showFront()
        } else {
            showBack()
        }
    }
    
    func flipFront() {
        self.imageView.isHidden = false
        UIView.transition(from: backgroundImage, to: backgroundFrontImage, duration: 0.4, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack() {
        self.imageView.isHidden = true
        UIView.transition(from: backgroundFrontImage, to: backgroundImage, duration: 0.4, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
    }
    
    func showFront(){
        backgroundFrontImage.isHidden = false
        imageView.isHidden = false
        backgroundImage.isHidden = true
    }
    
    func showBack() {
        backgroundImage.isHidden = false
        imageView.isHidden = true
        backgroundFrontImage.isHidden = true
    }
    
}
