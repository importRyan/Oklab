import XCTest
@testable import Oklab

func AssertOklabEqual(_ exp: OklabColor, _ result: OklabColor) {
    XCTAssertEqual(exp.lightness, result.lightness, accuracy: 0.001)
    XCTAssertEqual(exp.a, result.a, accuracy: 0.001)
    XCTAssertEqual(exp.b, result.b, accuracy: 0.001)
    XCTAssertEqual(exp.alpha, result.alpha, accuracy: 0.0001)
}
