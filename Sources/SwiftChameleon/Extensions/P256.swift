import Foundation

#if canImport(CryptoKit)
import CryptoKit

//MARK: - Typealiases
public typealias P256PrivateKey = P256.KeyAgreement.PrivateKey
public typealias P256SigningPrivateKey = P256.Signing.PrivateKey

public typealias P256PublicKey = P256.KeyAgreement.PublicKey
public typealias P256SigningPublicKey = P256.Signing.PublicKey

public extension P256PrivateKey {
    
    //MARK: - Properties
    var base64Representation: String {
        self.rawRepresentation.base64EncodedString()
    }
    
    //MARK: - Functions
    func sharedSymmetricKey(
        _ otherPartyPublicKey: P256.KeyAgreement.PublicKey,
        salt: Data? = nil,
        sharedInfo: Data? = nil
    ) throws -> SymmetricKey {
        let secret = try sharedSecretFromKeyAgreement(with: otherPartyPublicKey)
        return secret.hkdfDerivedSymmetricKey(
            using: SHA256.self,
            salt: salt ?? Data(),
            sharedInfo: sharedInfo ?? Data(),
            outputByteCount: 32
        )
    }
}

public extension P256PublicKey {
    var base64Representation: String {
        self.rawRepresentation.base64EncodedString()
    }
}

public extension P256SigningPrivateKey {
    var base64Representation: String {
        self.rawRepresentation.base64EncodedString()
    }
}

public extension P256SigningPublicKey {
    var base64Representation: String {
        self.rawRepresentation.base64EncodedString()
    }
}
#endif
