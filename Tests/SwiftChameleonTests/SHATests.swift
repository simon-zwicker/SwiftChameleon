import Testing
#if canImport(CryptoKit)
import CryptoKit

@testable import SwiftChameleon

@Test func testSHA256() async throws {
    let input = "abcäöü"
    let data = input.data(using: .utf8)!
    let hashString = SHA256.hashString(data: data)
    #expect(hashString == "168150a9cd98fd8eb10c73616b9c7df04432e5efff9029fb228ff668041d9c2c")
}

@Test func testSHA384() async throws {
    let input = "abcäöü"
    let data = input.data(using: .utf8)!
    let hashString = SHA384.hashString(data: data)
    #expect(hashString == "079deabf998285840960ed966c56f27a2e98529b95a59c3a9c5f34b86507185dab12da81e6e161a28153a17933095d4d")
}

@Test func testSHA512() async throws {
    let input = "abcäöü"
    let data = input.data(using: .utf8)!
    let hashString = SHA512.hashString(data: data)
    #expect(hashString == "16da0530288c7711ea46ba03315cd24e620a156d4bc63f65dd03b5f976bf26af44de3746fb5b4e4a2cd8130cc981c2a0ecf9ce419029a9f5b3b29909f978e652")
}
#endif
