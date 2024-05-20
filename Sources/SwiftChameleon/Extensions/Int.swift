//  File.swift
//  
//
//  Created by Nico on 04.05.24.
//  
//

import SwiftUI

public extension Int {
    
    // MARK: - Properties
    var isEven: Bool {
        self % 2 == 0
    }
    
    var double: Double {
        Double(self)
    }
    
    var float: Float {
        Float(self)
    }
    
    var cgFloat: CGFloat {
        CGFloat(self.float)
    }
    
    //MARK: - Funktions
    func divisibleBy(_ value: Int) -> Bool {
        self % value == 0
    }
    
    // MARK: - GridItems
    var grid: [GridItem] {
        var items: [GridItem] = []
        for _ in 0..<self { items.append(.init()) }
        return items
    }
    
    func gridFlex(_ min: CGFloat, _ max: CGFloat) -> [GridItem] {
        var items: [GridItem] = []
        for _ in 0..<self { items.append(.init(.flexible(minimum: min, maximum: max))) }
        return items
    }
    
    func gridFixed(_ width: CGFloat) -> [GridItem] {
        var items: [GridItem] = []
        for _ in 0..<self { items.append(.init(.fixed(width))) }
        return items
    }
    
    func gridAdaptive(_ min: CGFloat, _ max: CGFloat) -> [GridItem] {
        var items: [GridItem] = []
        for _ in 0..<self { items.append(.init(.adaptive(minimum: min, maximum: max))) }
        return items
    }
}
