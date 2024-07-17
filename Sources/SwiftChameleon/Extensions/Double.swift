//
//  Double.swift
//
//
//  Created by Simon Zwicker on 04.05.24.
//

import Foundation

public extension Double {
    
    //MARK: - Properties
    var float: Float {
        Float(self)
    }
    
    //strips decimalplaces
    var int: Int {
        Int(self)
    }
    
    var roundedInt: Int {
        Int(self.rounded())
    }

    var radians: Double {
        self * Double.pi / 180
    }

    var cgFloat: CGFloat {
        CGFloat(self)
    }

    //MARK: - Functions
    func multiply(_ value: Double = 100.0) -> Double {
        self * value
    }
    
    func string(_ decimalPlaces: Int = 10) -> String {
        String(format: "%.\(decimalPlaces)f", self)
    }
    
    func currencyString(_ decimalPlaces: Int = 2) -> String? {
        let formatter = NumberFormatter()
        if let prefered = Locale.preferredLanguages.first {
            formatter.locale = .init(identifier: prefered)
        } else {
            formatter.locale = .current
        }
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = decimalPlaces
        formatter.maximumFractionDigits = decimalPlaces
        
        return formatter.string(from: NSNumber(value: self))
    }
    
    func roundedTo(_ decimalPlaces: Int = 2) -> Double {
        let multiply = Double("\(pow(10, decimalPlaces))") ?? 0.0
        return (self * multiply).rounded() / multiply
    }
}
