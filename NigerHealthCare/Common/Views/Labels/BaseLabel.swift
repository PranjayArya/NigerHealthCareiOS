import UIKit

class BaseLabel: UILabel {

    @IBInspectable
    var labelTextColor: UIColor! {
        get { return self.textColor }
        set { self.textColor = newValue }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    func setup() {
        textColor = Colors.darkBlack.color
        numberOfLines = 0
    }
}
