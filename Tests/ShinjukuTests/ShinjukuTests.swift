import XCTest
@testable import Shinjuku

final class ShinjukuTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Shinjuku().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
