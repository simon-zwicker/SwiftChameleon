//
//  JSONHandler.swift
//
//
//  Created by Simon Zwicker on 05.05.24.
//

import Foundation

public struct JSONHandler {
    
    static func load(_ fileName: String) -> Data? {
        guard  let path = Bundle.main.path(forResource: fileName, ofType: "json") else { return nil }
        return try? Data(
            contentsOf: URL(filePath: path)
        )
    }
}
