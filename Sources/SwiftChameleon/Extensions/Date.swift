import Foundation

public extension Date {
    
    // MARK: - Properties
    var isWeekend: Bool {
        Calendar.current.isDateInWeekend(self)
    }
    
    var isToday: Bool {
        Calendar.current.isDate(.init(), inSameDayAs: self)
    }
    
    var intTimeIntervalSince1970: Int {
        Int(self.timeIntervalSince1970)
    }
    
    // MARK: - Functions
    func get(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
}
