import UIKit

class LargeSemiBoldLabel: BaseLabel {
    override func setup() {
        super.setup()
        self.font = Theme.Font.semiBold(FontSize.Large.rawValue)
    }
}
