import Foundation

#if canImport(Security)
import Security
import CoreFoundation

///Implementation of the RSA Public Key encryption algorithm using the Security framework
public class RSA {
    ///generates a PrivateKey and the fitting PublicKey, the PublicKey is representated as base64 encoded String, the PrivateKey is a Reference to a locally stored key anc can't be transmitted
    public static func generateKeyPair(_ keySize: RSAKeySize) throws -> RSAKeypair {
        
        //parameters for rsakey with size set in function call
        let keyPairAttr: [String: Any] = [kSecAttrKeyType as String: kSecAttrKeyTypeRSA, kSecAttrKeySizeInBits as String: keySize.rawValue]
        
        //if generation of key succeeded
        if let privateKey: SecKey = SecKeyCreateRandomKey(keyPairAttr as CFDictionary, nil) {
            
            //if extraction of publickey from privatekey succeeded
            if let publicKey = SecKeyCopyPublicKey(privateKey),
               let publicKeyRepresentation = SecKeyCopyExternalRepresentation(publicKey, nil) as? Data {
                
                //keypair with base64encoded public key and reference to privatekey
                let keyPair = RSAKeypair(publicKey: publicKeyRepresentation.base64EncodedString(), privateKey: privateKey.self)
                return keyPair
            }
        }
        throw RSAError.keyGenerationError
    }
    
    ///encrypts Data using OAEPSHA384
    public static func encrypt(_ data: Data, publicKey: SecKey? = nil, publicKeyBase64: String? = nil, keySize: RSAKeySize = .bit2048) throws -> Data {
        //attributes needed to encrypt with the rsa keys
        let keyAttr: [String: Any] = [kSecAttrKeyType as String: kSecAttrKeyTypeRSA, kSecAttrKeySizeInBits as String: keySize.rawValue, kSecAttrKeyClass as String: kSecAttrKeyClassPublic]
        var key: SecKey?
        if publicKey != nil {
            key = publicKey!
        }
        else if publicKeyBase64 != nil {
            if let data = Data(base64Encoded: publicKeyBase64!),
               let convertedKey = SecKeyCreateWithData(data as CFData, keyAttr as CFDictionary, nil) {
                key = convertedKey
            }
        }
        else {
            throw RSAError.encryptionInvalidArgumentError("missing key")
        }
        if key == nil {
            key = nil
            throw RSAError.publicKeyRetrievalError
        }
        if let encrypted = SecKeyCreateEncryptedData(key!, .rsaEncryptionOAEPSHA384, data as CFData, nil) {
            return encrypted as Data
        }
        //encryption failed
        throw RSAError.encryptionError
    }
    
    ///decrypts OAEPSHA384 encrypted Data
    public static func decrypt(_ data: Data, privateKey: SecKey)throws -> Data {
        if let clear = SecKeyCreateDecryptedData(privateKey, .rsaEncryptionOAEPSHA384, data as CFData, nil) {
            return clear as Data
        }
        //decryption failed
        throw RSAError.decryptionError
    }
}
#endif
