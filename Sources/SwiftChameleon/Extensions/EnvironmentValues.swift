
import SwiftUI

public extension EnvironmentValues {
    
    #if canImport(UIKit)
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
    #endif
}

