//
//  File.swift
//  
//
//  Created by Simon Zwicker on 04.05.24.
//

import SwiftUI

public extension View {

    // MARK: - Properties
    #if canImport(UIKit)
    var idiom : UIUserInterfaceIdiom {
        UIDevice.current.userInterfaceIdiom
    }
    
    var isPortrait : Bool {
        UIDevice.current.orientation.isPortrait
    }
    #endif
    
    // MARK: - Functions
    func button(_ role: ButtonRole? = nil, action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapper(role: role, action: action))
    }

    func loadingButton(_ role: ButtonRole? = nil, isLoading: Binding<Bool>, action: @escaping () -> Void) -> some View {
        modifier(LoadingButtonWrapper(role: role, isLoading: isLoading, action: action))
    }

    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        _ `if`: (Self) -> Content,
        `else`: ((Self) -> Content)? = nil
    ) -> some View {
        if condition {
            `if`(self)
        } else if let `else`{
            `else`(self)
        } else {
            self
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
