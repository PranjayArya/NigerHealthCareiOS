import UIKit

class BaseButton: UIButton {

    convenience init() {
        self.init(frame: CGRect.init())
        configureButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    // MARK: - Required methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureButton()
    }

    // MARK: - Configure default button settings
    func configureButton() {

    }
}
