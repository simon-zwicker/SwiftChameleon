//
//  File.swift
//
//
//  Created by Simon Zwicker on 04.05.24.
//
#if canImport(SwiftUI)
import SwiftUI

struct ButtonWrapper: ViewModifier {
    var role: ButtonRole?
    var action: () -> Void

    func body(content: Content) -> some View {
        Button(role: role, action: { action() }, label: { content })
    }
}
#endif
