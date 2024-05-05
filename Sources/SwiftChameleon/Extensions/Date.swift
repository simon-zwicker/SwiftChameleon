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
        Calendar.current.component(component, from: self)
    }
    
    func toString(with format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func add(for type: Calendar.Component, value: Int) -> Date? {
        Calendar.current.date(byAdding: type, value: value, to: self)
    }
}
