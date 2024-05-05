#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public class URLHandler {
    static func open(urlString: String) -> Bool {
        guard let url = URL(string: urlString) else { return false }
        open(url)
        return true
    }
    
    static func open(_ url: URL) {
        #if canImport(UIKit)
        UIApplication.shared.open(url)
        #elseif canImport(AppKit)
        NSWorkspace.shared.open(url)
        #endif
    }
}
