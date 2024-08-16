//  File.swift
//  
//
//  Created by Nico on 20.05.24.
//  
//
#if canImport(SwiftUI)
import Foundation
import SwiftUI

struct EmptyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}
#endif
