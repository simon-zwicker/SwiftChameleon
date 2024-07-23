//
//  File.swift
//  
//
//  Created by Simon Zwicker on 23.07.24.
//

import Foundation

public extension NumberFormatter {
    func digits(_ number: Int = 0) -> Self {
        self.numberStyle = .decimal
        self.roundingMode = .halfUp
        self.maximumFractionDigits = number
        return self
    }
}
