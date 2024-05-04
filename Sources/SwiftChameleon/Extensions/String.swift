//
//  File.swift
//  
//
//  Created by Simon Zwicker on 04.05.24.
//

import SwiftUI

public extension String {
    
    var isNotEmpty: Bool {
        !self.isEmpty
    }
    
    var translate: LocalizedStringKey {
        LocalizedStringKey(self)
    }
    
    var toArray: [Character] {
        Array(self)
    }
}
