//
//  File.swift
//  
//
//  Created by Simon Zwicker on 15.05.24.
//
#if canImport(SwiftUI)
import SwiftUI

struct LoadingButtonWrapper: ViewModifier {
    var role: ButtonRole?
    @Binding var isLoading: Bool
    var action: () -> Void

    func body(content: Content) -> some View {
        Button(role: role, action: { action() }, label: {
            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                content
            }
        })
    }
}
#endif
