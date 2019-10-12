
import UIKit

class LoadingView: BasicPlaceholderView, StatefulPlaceholderView {
    
    let label = UILabel()
    private var activityIndicator:UIActivityIndicatorView!
    override func setupView() {
        super.setupView()
                
        label.text = title
        label.translatesAutoresizingMaskIntoConstraints = false
        centerView.addSubview(label)
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        centerView.addSubview(activityIndicator)
        
        let views = ["label": label, "activity": activityIndicator] as [String : Any]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-[activity]-[label]-|", options: [], metrics: nil, views: views)
        let vConstraintsLabel = NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|", options: [], metrics: nil, views: views)
        let vConstraintsActivity = NSLayoutConstraint.constraints(withVisualFormat: "V:|[activity]|", options: [], metrics: nil, views: views)
        
        centerView.addConstraints(hConstraints)
        centerView.addConstraints(vConstraintsLabel)
        centerView.addConstraints(vConstraintsActivity)
    }
    
    
    override func setAppearance(style: LoadingUIAppearance) {
        if style == .dark {
            activityIndicator.color = UIColor.white
            self.backgroundColor = UIColor.black
            self.alpha = 0.5
            label.textColor = UIColor.white
        } else if style == .blossom{
            activityIndicator.color = Colors.violet.color
            self.backgroundColor = UIColor(r: 227, g: 230, b: 236)
            self.alpha = 0.5
            label.textColor = Colors.violet.color
        }else if style == .light{
            activityIndicator.color = UIColor.gray
            self.backgroundColor = UIColor.clear
            self.alpha = 1
            label.textColor = UIColor.gray
        }else{
            activityIndicator.color = UIColor.gray
            self.backgroundColor = UIColor.white
            self.alpha = 0.5
            label.textColor = UIColor.gray
        }
    }
    
    func placeholderViewInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
