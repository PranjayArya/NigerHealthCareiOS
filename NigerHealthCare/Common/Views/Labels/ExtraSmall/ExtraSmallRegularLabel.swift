import UIKit

class ExtraSmallRegularLabel: BaseLabel {

    override func setup() {
        super.setup()
        self.font = Theme.Font.regular(FontSize.ExSmall.rawValue)
    }
}
