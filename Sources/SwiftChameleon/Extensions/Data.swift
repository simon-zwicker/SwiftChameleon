#if canImport(CryptoKit)
import CryptoKit
#endif

import Foundation

public extension Data {
    
    //MARK: - Properties
    var octalString: String {
        return self.map { byte in
            String(format: "%03o", byte)
        }.joined()
    }
    
    //MARK: - Functions
    func decoded<T: Codable>(_ type: T.Type) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch {
            throw DataError.decode
        }
    }
    
    #if canImport(CryptoKit)
    static func randomBytes(count: Int = 32) throws -> Data {
        var keyData = Data(count: count)
        let result = keyData.withUnsafeMutableBytes { (rawMutableBufferPointer) in
            let bufferPointer = rawMutableBufferPointer.bindMemory(to: UInt8.self)
            if let address = bufferPointer.baseAddress {
                return SecRandomCopyBytes(kSecRandomDefault, count, address)
            }
            return Int32(-67808)
        }
        
        guard result == errSecSuccess else { throw DataError.failed }
        return keyData
    }
    #endif
}
