import UIKit

class SmallRegularLabel: BaseLabel {

    override func setup() {
        super.setup()
        self.font = Theme.Font.regular(FontSize.Small.rawValue)
    }
}
