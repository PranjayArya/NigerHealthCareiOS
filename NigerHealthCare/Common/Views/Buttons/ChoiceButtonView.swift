
import UIKit

class ChoiceButtonView: UIView {

    //MARK: - Class methods
    public static func newInstance() -> ChoiceButtonView{
        return Bundle.main.loadNibNamed("ChoiceButtonView", owner: self, options: nil)?.first as! ChoiceButtonView
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var button: ChoiceButton!

    //MARK: - Properties
    var choice:ImageChoice?{
        didSet{
            
            if let selectedStateImage = choice?.selectedStateImage{
                self.button.setImage(selectedStateImage, for: .selected)
            }
            
            if let normalStateImage = choice?.normalStateImage{
                self.button.setImage(normalStateImage, for: .normal)
            }
            
            if let text = choice?.text{
                self.button.setTitle(text, for: .normal)
            }
            
            if let selectedTitleColor = choice?.selectedStateTitleColor{
                self.button.setTitleColor(selectedTitleColor, for: .selected)
            }
            
            if let normalTitleColor = choice?.normalStateTitleColor{
                self.button.setTitleColor(normalTitleColor, for: .normal)
            }
        }
    }
    
    //MARK: - Life cycle methods 
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
