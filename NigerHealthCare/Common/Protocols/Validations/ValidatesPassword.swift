import Foundation

enum PasswordValidatorError:Error, CustomStringConvertible {
    case emptyPassword
    case invalidPassword
    case passwordIncorrect

    // MARK: - CustomStringConvertible
    public var description: String {
        switch self {
        case .emptyPassword:
            return "Password required".localized
        case .invalidPassword:
            return "Please enter valid password".localized
        case .passwordIncorrect:
            return "Password do not match".localized
        }
    }
}

protocol ValidatesPassword {
    func validatesPassword(_ password: String?) throws
}

extension ValidatesPassword {
    
    func validatesPassword(_ password: String?) throws {
        /* password is empty */
        if let password = password{
            if  password.isBlank{
                throw PasswordValidatorError.emptyPassword
            }
        }
    }
    
    func matchPassword(_ password: String?, from otherPassword:String?) throws {
        /* password is empty */
        if password != otherPassword{
                throw PasswordValidatorError.passwordIncorrect
        }
    }

}
