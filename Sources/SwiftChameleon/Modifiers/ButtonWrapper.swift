//
//  File.swift
//
//
//  Created by Simon Zwicker on 04.05.24.
//

import SwiftUI

struct ButtonWrapper: ViewModifier {
    var action: () -> Void

    func body(content: Content) -> some View {
        Button { action() } label: { content }
    }
}
