import UIKit

class RectangleButton: BaseButton {

    // MARK: - Constants
    let buttonBorderWidth: CGFloat = 0
    let buttonCornerRadius: CGFloat = 0

    // MARK: - Configuring default properties
    override func configureButton() {
        super.configureButton()

        //Layer
        self.layer.borderWidth = buttonBorderWidth
        self.layer.cornerRadius = buttonCornerRadius
//        self.layer.borderColor = Colors.gurkha.color.cgColor

        //Background
//        self.backgroundColor = Colors.gurkha.color

        //title
        self.setTitleColor(.white, for: .normal)
    }

}
