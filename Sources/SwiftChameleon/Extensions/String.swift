//
//  File.swift
//  
//
//  Created by Simon Zwicker on 04.05.24.
//
#if canImport(SwiftUI)
import SwiftUI
#endif

public extension String {
    
    //MARK: - Properties
    var isNotEmpty: Bool {
        !self.isEmpty
    }
    
#if canImport(SwiftUI)
    var translate: LocalizedStringKey {
        LocalizedStringKey(self)
    }
    #endif
    
    var toArray: [Character] {
        Array(self)
    }
    
    var octalDecodedData: Data? {
        if self.count % 3 != 0 {
            return nil
        }
        var octalWithPlaceholders = ""
        for i in 1...self.count {
            if i % 3 == 0 {
                octalWithPlaceholders += "\(self[self.index(self.startIndex, offsetBy: i-1)]) "
                continue
            }
            octalWithPlaceholders += "\(self[self.index(self.startIndex, offsetBy: i-1)])"
        }
        let components = octalWithPlaceholders.split(separator: " ")
        var bytes = [UInt8]()
        for octalStr in components {
            guard let octalInt = UInt8(octalStr, radix: 8) else { return nil }
            bytes.append(octalInt)
        }
        return Data(bytes)
    }
    
    var toDate: Date? {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self)
    }
    
    var toDouble: Double? {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .decimal
        return formatter.number(from: self)?.doubleValue
    }
    
    //MARK: - Functions
    func octalString(encoding: Encoding = .utf8)-> String? {
        self.data(using: encoding)?.octalString
    }
    
    func octalDecodedString(encoding: Encoding = .utf8)-> String? {
        guard let data = self.octalDecodedData else { return nil }
        return String(data: data, encoding: encoding)
    }
}
