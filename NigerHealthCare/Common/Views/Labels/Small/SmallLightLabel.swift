import UIKit

class SmallLightLabel: BaseLabel {

    override func setup() {
        super.setup()
        self.font = Theme.Font.light(FontSize.Small.rawValue)
    }
}
