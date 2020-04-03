import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cell: CardCollectionViewCell!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var brackgroundFrontImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


