import Foundation

#if canImport(Security)
public enum RSAKeySize: Int {
    case bit1024 = 1024
    case bit2048 = 2048
    case bit3072 = 3072
    case bit4096 = 4096
}
#endif
