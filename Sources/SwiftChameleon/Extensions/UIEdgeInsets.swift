#if canImport(SwiftUI)
import SwiftUI

#if canImport(UIKit)
public extension UIEdgeInsets {
    var swiftUIInsets: EdgeInsets {
        EdgeInsets(
            top: top,
            leading: left,
            bottom: bottom,
            trailing: right
        )
    }
}
#endif
#endif
