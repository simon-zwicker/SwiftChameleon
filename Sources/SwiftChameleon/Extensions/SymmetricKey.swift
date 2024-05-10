import Foundation
import CryptoKit

#if canImport(CryptoKit)
public extension SymmetricKey {
    //MARK: - Properties
    var base64String: String {
        let data = self.data
        return data.base64EncodedString()
    }
    
    var data: Data {
        self.withUnsafeBytes { Data($0) }
    }
    
    //MARK: - Functions
    func aesEncrypt(data: Data, nonce: AES.GCM.Nonce? = nil, authenticating: Data? = nil) -> Data? {
        if nonce.isNil, authenticating.isNil {
            return try? AES.GCM.seal(data, using: self).combined
        }

        if let nonce, authenticating.isNil {
            return try? AES.GCM.seal(data, using: self, nonce: nonce).combined
        }

        if nonce.isNil, let authenticating {
            return try? AES.GCM.seal(data, using: self, authenticating: authenticating).combined
        }

        guard let authenticating else { return nil }
        return try? AES.GCM.seal(data, using: self, nonce: nonce, authenticating: authenticating).combined
    }
    
    func aesDecrypt(data: Data) -> Data? {
        guard let box = try? AES.GCM.SealedBox(combined: data) else { return nil }
        return try? AES.GCM.open(box, using: self)
    }
    
    //MARK: - static Functions
    static func fromBase64String(_ base64String: String) -> SymmetricKey? {
        guard let data = Data(base64Encoded: base64String) else { return nil }
        return SymmetricKey(data: data)
    }
}
#endif
