//
//  Double.swift
//
//
//  Created by Simon Zwicker on 04.05.24.
//

extension Double {
    func string(decimalPlaces: Int = 10) -> String {
        String(format: "%.\(decimalPlaces)f", self)
    }
}
