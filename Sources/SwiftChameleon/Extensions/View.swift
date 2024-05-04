//
//  File.swift
//  
//
//  Created by Simon Zwicker on 04.05.24.
//

import SwiftUI

public extension View {
    
    func button(action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapper(action: action))
    }
    
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func ifelse<Content: View>(_ condition: Bool, _ `if`: (Self) -> Content, _ `else`: (Self) -> Content) -> some View {
        if condition {
            `if`(self)
        } else {
            `else`(self)
        }
    }
    
    #if canImport(UIKit)
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
    #endif
}
