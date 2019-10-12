import UIKit

protocol SearchFieldDelegate: class {
    func searchFieldDidCancel(searchField: SearchField)
    func didTapAlternateSearch()
}

class SearchField: UITextField {
    weak var searchFieldDelegate: SearchFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
    }
    
    @objc func didTapClose() {
        if let text = self.text, text.count > 0 {
            self.text = nil
        } else {
            searchFieldDelegate?.searchFieldDidCancel(searchField: self)
        }
    }
    
    @objc func didTapAlternateSearch() {
        searchFieldDelegate?.didTapAlternateSearch()
    }
}

