#if !os(Linux)
import Foundation

public extension URL {
    func open() {
        URLHandler.open(self)
    }
}
#endif
