//
//  File.swift
//  
//
//  Created by Simon Zwicker on 04.05.24.
//

import SwiftUI

public extension String {
    
    var isNotEmpty: Bool {
        !self.isEmpty
    }
    
    var translate: LocalizedStringKey {
        LocalizedStringKey(self)
    }
    
    var toArray: [Character] {
        Array(self)
    }
    
    var octalDecodedData: Data? {
        if self.count % 3 != 0{
            return nil
        }
        var octalWithPlaceholders = ""
        for i in 1...self.count{
            if i % 3 == 0{
                octalWithPlaceholders += "\(self[self.index(self.startIndex, offsetBy: i-1)]) "
                continue
            }
            octalWithPlaceholders += "\(self[self.index(self.startIndex, offsetBy: i-1)])"
        }
        let components = octalWithPlaceholders.split(separator: " ")
        var bytes = [UInt8]()
        for octalStr in components{
            guard let octalInt = UInt8(octalStr, radix: 8) else {
                return nil
            }
            bytes.append(octalInt)
        }
        return Data(bytes)
    }
    
    func octalString(encoding: Encoding = .utf8)-> String? {
        guard let data = self.data(using: encoding) else {
            return nil
        }
        return data.octalString
    }
    
    func octalDecodedString(encoding: Encoding = .utf8)-> String? {
        guard let data = self.octalDecodedData else {
            return nil
        }
        return String(data: data, encoding: encoding)
    }
}
