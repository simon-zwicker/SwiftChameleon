import Foundation

#if canImport(CryptoKit)
import CryptoKit

extension SHA256 {
    static func hashString(data: Data) -> String {
        let digest = SHA256.hash(data: data)
        let digestData = Data(digest)
        let hashString = digestData.map { String(format: "%02hhx", $0) }.joined()
        return hashString
    }
}

extension SHA384 {
    static func hashString(data: Data) -> String {
        let digest = SHA384.hash(data: data)
        let digestData = Data(digest)
        let hashString = digestData.map { String(format: "%02hhx", $0) }.joined()
        return hashString
    }
}

extension SHA512 {
    static func hashString(data: Data) -> String {
        let digest = SHA512.hash(data: data)
        let digestData = Data(digest)
        let hashString = digestData.map { String(format: "%02hhx", $0) }.joined()
        return hashString
    }
}
#endif
