
import UIKit

class CommonEmptyStateView: UIView {
    
    //MARK: IBOutlets
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var ivImageView: UIImageView!
    
    @IBOutlet weak var cPrimaryButtonHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var cPrimaryButtonWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lcImageViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lTitleLabel: ExtraLargeSemiBoldLabel!
    
    @IBOutlet weak var lDetailLabel: RegularLightLabel!
   
    @IBOutlet weak var bPrimaryButton: RoundedButton!
        
    @IBOutlet weak var lcPrimaryButtonWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var svScrollView: BaseScrollView!
  
    
    @IBOutlet weak var vContentView: UIView!
    
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
        
        Bundle.main.loadNibNamed("CommonEmptyStateView", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.bounds
        
        view.translatesAutoresizingMaskIntoConstraints = false
        Constraint.pinAllEdgesOfSubview(subview: view, superView: self)
        setup()

    }
    
    func setup(){

    }
    
}

extension CommonEmptyStateView{
    
    func attributedEmptyStateDescriptionForText(text:String?) -> NSAttributedString?{
        guard let text = text else {return nil}
        
        var attributes = [NSAttributedStringKey:Any]()
        
        let paragraph:NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        paragraph.alignment = .center
        paragraph.lineSpacing = 6.0
        
        let font = UIFont.gibsonFont(type: .Light, size: .Regular)
        let textColor = Colors.gray.color

        attributes[NSAttributedStringKey.font] = font
        attributes[NSAttributedStringKey.foregroundColor] = textColor
        attributes[NSAttributedStringKey.paragraphStyle] = paragraph
        
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        return attributedString
    }
}

extension String{
    
    var attributedDescription:NSAttributedString?{
        let text = self
        
        var attributes = [NSAttributedStringKey:Any]()
        
        let paragraph:NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        paragraph.alignment = .center
        paragraph.lineSpacing = 6.0
        
        let font = UIFont.gibsonFont(type: .Light, size: .Regular)
        let textColor = Colors.black.color
        
        attributes[NSAttributedStringKey.font] = font
        attributes[NSAttributedStringKey.foregroundColor] = textColor
        attributes[NSAttributedStringKey.paragraphStyle] = paragraph
        
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        return attributedString
    }

}
