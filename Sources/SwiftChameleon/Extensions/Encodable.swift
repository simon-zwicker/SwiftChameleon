//
//  Codable.swift
//
//
//  Created by Simon Zwicker on 04.05.24.
//

import Foundation

public extension Encodable {
    func encoded() throws -> Data {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            throw error
        }
    }
}
