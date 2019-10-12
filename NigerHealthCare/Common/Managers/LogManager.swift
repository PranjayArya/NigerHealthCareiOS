import Foundation

struct Log {
    
    static func debug(_ items: Any?) {
        guard let items = items else { return }
        #if DEBUG
        if let data = items as? [String: Any] {
            print(prettyPrint(data: data))
        }else {
            print(items)
        }
        #endif
    }
    
    static func prettyPrint(data: [String: Any]) -> String{
        var string: String = ""
        if let data = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted){
            if let nstr = NSString(data: data, encoding: String.Encoding.utf8.rawValue){
                string = nstr as String
            }
        }
        return string
    }
    
}
