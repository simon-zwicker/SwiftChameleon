import Foundation

public extension URL {
    func open() {
        URLHandler.open(self)
    }
}
