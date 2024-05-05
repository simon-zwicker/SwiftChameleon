//  File.swift
//  
//
//  Created by Nico on 05.05.24.
//  
//

import Foundation

public extension Bool {
    
    // MARK: - Properties
    var opposit: Bool {
        !self
    }
    
    var string: String {
        "\(self)"
    }
    
    // MARK: - Functions
    mutating func setTrue() {
        self = true
    }
    
    mutating func setFalse() {
        self = false
    }
}
