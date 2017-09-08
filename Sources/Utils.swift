import Foundation
public class Utils {
    
    public class func tokenForKey(_ key: String) -> String? {
        return ProcessInfo.processInfo.environment[key]
    }
    
}
