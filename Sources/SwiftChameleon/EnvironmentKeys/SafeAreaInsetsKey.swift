#if canImport(SwiftUI)
import SwiftUI


#if canImport(UIKit)



public struct SafeAreaInsetsKey: EnvironmentKey {
    public static var defaultValue: EdgeInsets {
        UIApplication.shared.keyWindow?.safeAreaInsets.swiftUIInsets ?? EdgeInsets()
    }
}
#endif
#endif
