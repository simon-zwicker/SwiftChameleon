import Foundation

#if canImport(Security)
import Security
import CoreFoundation

///Implementation of the RSA Public Key encryption algorithm using the Security framework
public class RSA {
    ///generates a PrivateKey and the fitting PublicKey, the PublicKey is representated as base64 encoded String, the PrivateKey is a Reference to a locally stored key anc can't be transmitted
    public static func generateKeyPair(_ keySize: RSAKeySize) throws -> RSAKeypair {
        
        //parameters for rsakey with size set in function call
        let keyPairAttr: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecAttrKeySizeInBits as String: keySize.rawValue
        ]
        
        //if generation of key succeeded
        guard 
            let privateKey: SecKey = SecKeyCreateRandomKey(keyPairAttr as CFDictionary, nil),
            let publicKey = SecKeyCopyPublicKey(privateKey),
            let publicKeyRepresentation = SecKeyCopyExternalRepresentation(publicKey, nil) as? Data
        else { throw RSAError.keyGenerationError }
        
        let keyPair = RSAKeypair(
            publicKey: publicKeyRepresentation.base64EncodedString(),
            privateKey: privateKey.self
        )
        return keyPair
    }
    
    ///encrypts Data using OAEPSHA384
    public static func encrypt(
        _ data: Data,
        publicKey: SecKey? = nil,
        publicKeyBase64: String? = nil,
        keySize: RSAKeySize = .bit2048
    ) throws -> Data {
        //attributes needed to encrypt with the rsa keys
        let keyAttr: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecAttrKeySizeInBits as String: keySize.rawValue,
            kSecAttrKeyClass as String: kSecAttrKeyClassPublic
        ]

        var key: SecKey?

        if let publicKey {
            key = publicKey
        } else if 
            let publicKeyBase64,
            let data = Data(base64Encoded: publicKeyBase64),
            let convertedKey = SecKeyCreateWithData(data as CFData, keyAttr as CFDictionary, nil)
        {
            key = convertedKey
        } else {
            throw RSAError.encryptionInvalidArgumentError("missing key")
        }

        guard let key else { throw RSAError.publicKeyRetrievalError }
        guard let encrypted = SecKeyCreateEncryptedData(key, .rsaEncryptionOAEPSHA384, data as CFData, nil) else {
            throw RSAError.encryptionError
        }
        
        return encrypted as Data
    }
    
    ///decrypts OAEPSHA384 encrypted Data
    public static func decrypt(_ data: Data, privateKey: SecKey) throws -> Data {
        guard let clear = SecKeyCreateDecryptedData(privateKey, .rsaEncryptionOAEPSHA384, data as CFData, nil) else {
            throw RSAError.decryptionError
        }

        return clear as Data
    }
}
#endif
