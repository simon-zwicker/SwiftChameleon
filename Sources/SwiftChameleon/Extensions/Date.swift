import Foundation

public extension Date {
    
    // MARK: - Properties
    var isWeekend: Bool {
        Calendar.current.isDateInWeekend(self)
    }
    
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    // MARK: - Functions
    func get(for component: Calendar.Component) -> Int {
        Calendar.current.component(component, from: self)
    }
    
    func toString(with format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func add(for component: Calendar.Component, value: Int) -> Date? {
        Calendar.current.date(byAdding: component, value: value, to: self)
    }
}
