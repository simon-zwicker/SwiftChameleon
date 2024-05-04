//  File.swift
//  
//
//  Created by Nico on 04.05.24.
//  
//

import Foundation

extension Date {
    
    func get(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
    
    func isWeekend() -> Bool {
        return Calendar.current.isDateInWeekend(self)
    }
    
    func isToday() -> Bool {
        return Calendar.current.isDate(Date(), inSameDayAs: self)
    }
}
