#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
import XCTest
@testable import Oklab

final class PolarHueTests: XCTestCase {
    
    func testHueRotation() {
        let testColor = OklabColorPolar.gray50.withHue(degrees: 10)
        let exp = Channel(90)
        
        let result = testColor.withHueRotatedBy(degrees: 80)
        
        XCTAssertEqual(result.hueDegrees, exp, accuracy: 0.01)
    }
    
    func testHueRotationReverse() {
        let testColor = OklabColorPolar.gray50.withHue(degrees: -10)
        let exp = Channel(270)
        
        let result = testColor.withHueRotatedBy(degrees: -80)
        
        XCTAssertEqual(result.hueDegrees, exp, accuracy: 0.01)
    }
    
    func testHueRotation360() {
        let testColor = OklabColorPolar.gray50.withHue(degrees: -10)
        let exp = Channel(350)
        
        let result = testColor.withHueRotatedBy(degrees: -360)
        
        XCTAssertEqual(result.hueDegrees, exp, accuracy: 0.01)
    }
    
    func testHueRotation180() {
        let testColor = OklabColorPolar.gray50.withHue(degrees: -10)
        let exp = Channel(170)
        
        let result = testColor.withHueRotatedBy(degrees: 180)
        
        XCTAssertEqual(result.hueDegrees, exp, accuracy: 0.01)
    }
    
    func testHueRotation1080() {
        let testColor = OklabColorPolar.gray50.withHue(degrees: 0.1)
        let exp = Channel(0.1)
        
        let result = testColor.withHueRotatedBy(degrees: 1080)
        
        XCTAssertEqual(result.hueDegrees, exp, accuracy: 0.01)
    }
    
}
#endif
