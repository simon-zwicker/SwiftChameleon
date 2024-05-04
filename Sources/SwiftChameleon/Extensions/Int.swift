//  File.swift
//  
//
//  Created by Nico on 04.05.24.
//  
//

import Foundation

public extension Int {
    var isEven: Bool {
        self % 2 == 0
    }
    
    var double: Double {
        Double( self )
    }
    
    var float: Float {
        Float( self )
    }
    
    var cgFloat: CGFloat {
        CGFloat( self.float )
    }
    
    func divisibleBy(_ value: Int )-> Bool {
        self % value == 0
    }
}
