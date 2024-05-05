import XCTest
@testable import SwiftChameleon

final class P256Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEncryptDecrypt() throws {
        let data = "I wan't to arrive unrecognized".data(using: .utf8)!
        let privateKey = P256PrivateKey()
        let publicKey = privateKey.publicKey
        
        let recieverPrivateKey = P256PrivateKey()
        let recieverPublicKey = recieverPrivateKey.publicKey
        
        let salt = try Data.randomBytes()
        
        let key = try privateKey.sharedSymmetricKey(recieverPublicKey, salt: salt)
        let recieverKey = try recieverPrivateKey.sharedSymmetricKey(publicKey, salt: salt)
        
        let enc = try key.aesEncrypt(data: data) ?? "error".data(using: .utf8)!
        let dec = try recieverKey.aesDecrypt(data: enc) ?? "error".data(using: .utf8)!
        
        XCTAssertTrue(dec == data)
    }
    
    func testSigning() throws {
        let data = "I wan't to arrive unrecognized".data(using: .utf8)!
        
        let privateKey = P256SigningPrivateKey()
        let publicKey = privateKey.publicKey
        
        let signature = try privateKey.signature(for: data)
        
        XCTAssertTrue(publicKey.isValidSignature(signature, for: data))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
