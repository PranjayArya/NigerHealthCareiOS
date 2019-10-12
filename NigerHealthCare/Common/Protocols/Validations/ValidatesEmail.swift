import Foundation

public enum EmailValidatorError:Error, CustomStringConvertible {
    case error(String)
    case emptyEmail
    case invalidEmail
    
    // MARK: - CustomStringConvertible
    public var description: String {
        switch self {
        case .error(let message):
            return message
        case .emptyEmail:
            return "Email ID required".localized
        case .invalidEmail:
            return "Please enter valid email ID".localized
        }
    }
}

protocol ValidatesEmail {
    func validatesEmail(_ email: String?) throws
}

extension ValidatesEmail{
    func validatesEmail(_ email: String?) throws {
        /* contact number is empty */
        
        if let email  = email{
            if  email.isBlank{
                throw EmailValidatorError.emptyEmail
            } else if !ValidationUtils.isValidEmail(email) {
                throw EmailValidatorError.invalidEmail
            }
        }else{
            throw EmailValidatorError.emptyEmail
        }
    }
}
