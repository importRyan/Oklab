import XCTest
@testable import Oklab

func AssertVectorsEqual(_ left: SIMD3<Channel>, _ right: SIMD3<Channel>) {
    XCTAssertEqual(left.x, right.x, accuracy: 0.001)
    XCTAssertEqual(left.y, right.y, accuracy: 0.001)
    XCTAssertEqual(left.z, right.z, accuracy: 0.001)
}
