#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
import XCTest
@testable import Oklab

final class CIColorTests: XCTestCase {
    
    func testBlack_ConversionAndRoundTrip() {
        
        let test = NSColor(srgbRed: 0,
                           green: 0,
                           blue: 0,
                           alpha: 1)
        
        let exp = OklabColor(lightness: 0,
                             a: 0,
                             b: 0,
                             alpha: 1)
        
        let result = OklabColor(ns: test)
        
        AssertOklabEqual(exp, result)

        let returned = NSColor(result).getSRGBComponents()
        let original = test.getSRGBComponents()
        
        AssertVectorsEqual(returned.color, original.color)
    }
    
    func testBlack_Hue() {
        
        let test = NSColor(srgbRed: 0,
                           green: 0,
                           blue: 0,
                           alpha: 1)
        
        let expHue = Float(0)
    
        let resultHue = OklabColor(ns: test).getHueAngleDegrees()

        XCTAssertEqual(expHue, resultHue, accuracy: 1)
    }
    
    func testWhite_ConversionAndRoundTrip() {
        
        let test = NSColor(srgbRed: 1,
                           green: 1,
                           blue: 1,
                           alpha: 1)
        
        let exp = OklabColor(lightness: 1,
                             a: 0,
                             b: 0,
                             alpha: 1)
        
        let result = OklabColor(ns: test)
        
        AssertOklabEqual(exp, result)
        
        let returned = NSColor(result).getSRGBComponents()
        
        AssertVectorsEqual(returned.color, test.getSRGBComponents().color)
    }
    
    func testWhite_Hue() {
        
        let test = NSColor(srgbRed: 1,
                           green: 1,
                           blue: 1,
                           alpha: 1)
        
        let expHue = Float(90) // oddities :)
    
        let resultHue = OklabColor(ns: test).getHueAngleDegrees()

        XCTAssertEqual(expHue, resultHue, accuracy: 1)
    }
    
    func testGreen_ConversionAndRoundTrip() {
        
        let test = NSColor.green
        let exp = OklabColor(lightness: 0.866,
                             a: -0.233,
                             b: 0.179,
                             alpha: 1)
        
        let result = OklabColor(ns: test)
        
        AssertOklabEqual(exp, result)
        
        let returned = NSColor(result).getSRGBComponents()
        
        AssertVectorsEqual(returned.color, test.getSRGBComponents().color)
    }
    
    func testGreen_Hue() {
        
        let test = NSColor.green
        
        let expHue = Float(142) // sRGB HSV will not align
    
        let resultHue = OklabColor(ns: test).getHueAngleDegrees()

        XCTAssertEqual(expHue, resultHue, accuracy: 1)
    }
    
    func testRed_ConversionAndRoundTrip() {
        
        let test = NSColor.red
        let exp = OklabColor(lightness: 0.627,
                             a: 0.224,
                             b: 0.125,
                             alpha: 1)
        
        let result = OklabColor(ns: test)
        
        AssertOklabEqual(exp, result)
        
        let returned = NSColor(result).getSRGBComponents()
        
        AssertVectorsEqual(returned.color, test.getSRGBComponents().color)
    }
    
    func testRed_Hue() {
        
        let test = NSColor.red
        
        let expHue = Float(29) // sRGB HSV will not align
    
        let resultHue = OklabColor(ns: test).getHueAngleDegrees()

        XCTAssertEqual(expHue, resultHue, accuracy: 1)
    }
    
    func testYellow_ConversionAndRoundTrip() {
        
        let test = NSColor.yellow
        let exp = OklabColor(lightness: 0.967,
                             a: -0.071,
                             b: 0.198,
                             alpha: 1)
        
        let result = OklabColor(ns: test)
        
        AssertOklabEqual(exp, result)
        
        let returned = NSColor(result).getSRGBComponents()
        
        AssertVectorsEqual(returned.color, test.getSRGBComponents().color)
    }
    
    func testYellow_Hue() {
        
        let test = NSColor.yellow
        
        let expHue = Float(110) // sRGB HSV will not align
    
        let resultHue = OklabColor(ns: test).getHueAngleDegrees()

        XCTAssertEqual(expHue, resultHue, accuracy: 1)
    }
    
    func testBlue_ConversionAndRoundTrip() {
        
        let test = NSColor.blue
        let exp = OklabColor(lightness: 0.452,
                             a: -0.032,
                             b: -0.311,
                             alpha: 1)
        
        let result = OklabColor(ns: test)
        
        AssertOklabEqual(exp, result)
        
        let returned = NSColor(result).getSRGBComponents()
        
        AssertVectorsEqual(returned.color, test.getSRGBComponents().color)
    }
    
    func testBlue_Hue() {
        
        let test = NSColor.blue
        
        let expHue = Float(264) // sRGB HSV will not align
    
        let resultHue = OklabColor(ns: test).getHueAngleDegrees()

        XCTAssertEqual(expHue, resultHue, accuracy: 1)
    }
}
#endif
