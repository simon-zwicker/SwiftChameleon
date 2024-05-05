import Foundation

#if canImport(Security)
public enum RSAError: Error {
    case keyGenerationError
    case encryptionInvalidArgumentError( String )
    case publicKeyRetrievalError
    case encryptionError
    case decryptionError
}
#endif
