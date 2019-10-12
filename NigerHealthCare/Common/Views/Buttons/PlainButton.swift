import UIKit

class PlainButton: BaseButton {

    // MARK: - Required methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureButton()
    }

    override func configureButton() {
        self.setTitleColor(Colors.primary.color, for: .normal)
        self.backgroundColor = .clear
        titleLabel?.font = UIFont.gibsonFont(type: .SemiBold, size: .Regular)
    }
}
