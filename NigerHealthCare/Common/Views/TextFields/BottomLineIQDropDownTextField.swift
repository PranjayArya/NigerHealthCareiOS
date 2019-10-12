import UIKit
import IQDropDownTextField

class BottomLineIQDropDownTextField: IQDropDownTextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        self.addBorderBottom(size: 1, color: Colors.paleGrey.color)
    }
}
