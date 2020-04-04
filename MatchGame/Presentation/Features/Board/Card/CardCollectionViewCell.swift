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
        
        if card.isMatch {
            self.alpha = 0
            return
        }
        else {
            self.alpha = 1
        }
        
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
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5) {
            self.imageView.isHidden = true
            UIView.transition(from: self.backgroundFrontImage, to: self.backgroundImage, duration: 0.4, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
    }
    
    func remove(){
        self.backgroundImage.isHidden = true
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .autoreverse, animations: {
            self.backgroundFrontImage.alpha = 0
            self.imageView.alpha = 0
        }, completion: nil)
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
