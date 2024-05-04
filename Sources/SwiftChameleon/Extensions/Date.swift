//  File.swift
//  
//
//  Created by Nico on 04.05.24.
//  
//

import Foundation

public extension Date {
    
    // MARK: - Properties
    var isWeekend: Bool {
        Calendar.current.isDateInWeekend(self)
    }
    
    var isToday: Bool {
        Calendar.current.isDate(.init(), inSameDayAs: self)
    }
    
    // MARK: - Functions
    func get(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
}
