//  File.swift
//  
//
//  Created by Nico on 20.05.24.
//  
//

import Foundation
import SwiftUI

struct EmptyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}
