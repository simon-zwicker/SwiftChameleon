import Foundation

#if canImport(Security)
import Security

public struct RSAKeypair{
    public let publicKey: String
    public let privateKey: SecKey
}
#endif
