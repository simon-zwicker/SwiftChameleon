import Foundation

public extension Optional {
    // Füge eine Methode hinzu, die überprüft, ob der Optional leer ist
    var isNil: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return false
        }
    }
}
