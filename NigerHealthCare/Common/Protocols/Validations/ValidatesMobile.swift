import Foundation

public enum NumberValidatorError:Error, CustomStringConvertible {
    case error(String)
    case emptyContactNumber
    case nonTenDigitNumber
    case invalidNumber

    // MARK: - CustomStringConvertible
    public var description: String {
        switch self {
        case .error(let message):
            return message
        case .emptyContactNumber:
            return "Mobile number required".localized
        case .nonTenDigitNumber:
            return "Mobile number should be 10 digits".localized
        case .invalidNumber:
            return "Please enter a valid number".localized
        }
    }
}

protocol ValidatesMobile {
    func validatesMobile(_ number: String?) throws
}

extension ValidatesMobile{
    func validatesMobile(_ number: String?) throws {
        /* contact number is empty */
        
        if let number  = number{
            if  number.isBlank{
                throw NumberValidatorError.emptyContactNumber
            } else if number.count != 10 {
                throw NumberValidatorError.nonTenDigitNumber
            } else if !ValidationUtils.isValidTenDigitPhoneNumber(number) {
                throw NumberValidatorError.invalidNumber
            }
        }else{
            throw NumberValidatorError.emptyContactNumber
        }
    }
}
