
import UIKit

class CommonEmptyDescriptionView: UIView {
    
    //MARK: IBOutlets
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var svScrollView: BaseScrollView!
    
    @IBOutlet weak var lTitleLabel: RegularLightLabel!
    @IBOutlet weak var lDescriptionLabel: RegularLightLabel!
    
    @IBOutlet weak var bTitleButton: PlainButton!
    @IBOutlet weak var bDescriptionButton: PlainButton!
    
    //MARK: Life cycle methods
    init() {
        super.init(frame: CGRect())
        fromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func fromNib(){
    
        Bundle.main.loadNibNamed("CommonEmptyDescriptionView", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.bounds
        
        view.translatesAutoresizingMaskIntoConstraints = false
        Constraint.pinAllEdgesOfSubview(subview: view, superView: self)
        setup()
    }
    
    func setup(){
        
    }
}

