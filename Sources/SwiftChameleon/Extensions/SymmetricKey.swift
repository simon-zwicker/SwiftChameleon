import Foundation
#if canImport(CryptoKit)
import CryptoKit

public extension SymmetricKey {
    //MARK: - Properties
    var base64String: String {
        let data = self.withUnsafeBytes { Data($0) }
        return data.base64EncodedString()
    }
    
    //MARK: - Functions
    func aesEncrypt(data: Data, nonce: AES.GCM.Nonce? = nil, authenticating: Data? = nil) throws -> Data? {
        if nonce.isNil && authenticating.isNil {
            return try AES.GCM.seal(data, using: self).combined ?? nil
        }
        if !nonce.isNil && authenticating.isNil {
            return try AES.GCM.seal(data, using: self, nonce: nonce).combined ?? nil
        }
        if nonce.isNil && !authenticating.isNil {
            return try AES.GCM.seal(data, using: self, authenticating: authenticating!).combined ?? nil
        }
        return try AES.GCM.seal(data, using: self, nonce: nonce, authenticating: authenticating!).combined ?? nil
    }
    
    func aesDecrypt(data: Data) throws -> Data? {
        do {
            let box = try AES.GCM.SealedBox(combined: data)
            return try AES.GCM.open(box, using: self)
        }
        catch { return nil }
    }
    
    //MARK: - static Functions
    static func fromBase64String(_ base64String: String) -> SymmetricKey? {
        if let data = Data(base64Encoded: base64String) {
            return SymmetricKey(data: data)
        }
        return nil
    }
}



#endif
