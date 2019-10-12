import UIKit

class RegularSemiBoldLabel: BaseLabel {

    override func setup() {
        super.setup()
        self.font = Theme.Font.semiBold(FontSize.Regular.rawValue)
    }
}
