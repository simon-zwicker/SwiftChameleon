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
    
    //if-else if-else alternative to function above
    ///currently every view parameter has to be declared, i don't know why
    @ViewBuilder
    func when(
        _ condition: Bool,
        _ condition2: Bool? = nil,
        then: (Self) -> some View,
        or: ((Self) -> some View)? = nil,
        otherwise: ((Self) -> some View)? = nil
    ) -> some View {
        if condition {
            then(self)
        } else if let condition2 = condition2, condition2, let or {
            or(self)
        } else if let otherwise {
            otherwise(self)
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
