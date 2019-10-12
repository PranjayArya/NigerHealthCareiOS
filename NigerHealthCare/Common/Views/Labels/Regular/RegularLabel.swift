import UIKit

class RegularLabel: BaseLabel {

    override func setup() {
        super.setup()
        self.font = Theme.Font.regular(FontSize.Regular.rawValue)
    }
}
