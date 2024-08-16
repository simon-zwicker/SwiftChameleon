#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

#if !os(Linux)
public class URLHandler {
    public static func open(urlString: String) -> Bool {
        guard let url = URL(string: urlString) else { return false }
        open(url)
        return true
    }
    
    public static func open(_ url: URL) {
        #if canImport(UIKit)
        UIApplication.shared.open(url)
        #elseif canImport(AppKit)
        NSWorkspace.shared.open(url)
        #endif
    }
}
#endif
