import UIKit

class RegularLightLabel: BaseLabel {

    override func setup() {
        super.setup()
        self.font = Theme.Font.light(FontSize.Regular.rawValue)
    }
}
