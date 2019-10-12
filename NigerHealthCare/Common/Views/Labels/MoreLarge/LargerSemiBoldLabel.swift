import UIKit

class LargerSemiBoldLabel: BaseLabel {
    override func setup() {
        super.setup()
        self.font = Theme.Font.semiBold(FontSize.Larger.rawValue)
    }
}
