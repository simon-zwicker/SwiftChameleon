//
//  Data.swift
//
//
//  Created by Simon Zwicker on 04.05.24.
//

import Foundation

public extension Data {
    func decoded<T: Codable>(_ type: T.Type) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch {
            throw error
        }
    }
    
    var octalString: String {
        return self.map {byte in
            String(format: "%03o", byte)
        }.joined()
    }
}
