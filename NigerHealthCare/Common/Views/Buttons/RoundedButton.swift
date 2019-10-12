import UIKit

class RoundedButton: BaseButton {

    // MARK: Initialization methods
    override func draw(_ rect: CGRect) {
        super.draw(rect)
//        self.cornerRadius = self.frame.size.height / 2;
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }

    // MARK: - Configuring default properties
    override func configureButton() {
        super.configureButton()

        //Layer
//        self.layer.borderColor = Colors.crocodile.color.cgColor
//        self.cornerRadius = self.frame.size.height / 2;
//        self.borderWidth = RoundedButtonDimensions.buttonBorderWidth
        //Background
        self.backgroundColor = UIColor.clear

        //Title
//        setTitleColor(Colors.gurkha.color, for: .normal)
        setTitleColor(Colors.white.color, for: .highlighted)

//        self.frame.size.height = RoundedButtonDimensions.buttonHeight
//        self.frame.size.width = RoundedButtonDimensions.buttonWidth
//
        self.clipsToBounds = true

    }

    //Button when tapped
    override var isHighlighted: Bool {
        didSet {
//            self.backgroundColor = isHighlighted ? Colors.gurkha.color : Colors.clear.color
        }
    }

}
