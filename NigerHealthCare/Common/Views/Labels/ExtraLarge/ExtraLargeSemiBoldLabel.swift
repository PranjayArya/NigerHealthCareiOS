import UIKit

class ExtraLargeSemiBoldLabel: BaseLabel {

    override func setup() {
        super.setup()
        self.font = Theme.Font.semiBold(FontSize.ExLarge.rawValue)
    }
}
