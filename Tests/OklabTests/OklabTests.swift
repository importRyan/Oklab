import simd
import XCTest
@testable import Oklab

final class OklabTests: XCTestCase {
    
    func testBjörn1() {
        
        let testXYZ = SIMD3<Channel>(0.95, 1, 1.089)
        let exp = SIMD3<Channel>(1, 0 ,0)

        let testLinearRGB = simd_mul(xyzToLinearRGB, testXYZ)
        let result = Conversions.linearSRGBToOklab(testLinearRGB)
        let reversed = Conversions.oklabToLinearSRGB(result)
        
        AssertVectorsEqual(result, exp)
        AssertVectorsEqual(reversed, testLinearRGB)
    }
    
    func testBjörn2() {
        
        let testXYZ = SIMD3<Channel>(1, 0, 0)
        let exp = SIMD3<Channel>(0.45, 1.236, -0.019)

        let testLinearRGB = simd_mul(xyzToLinearRGB, testXYZ)
        let result = Conversions.linearSRGBToOklab(testLinearRGB)
        let reversed = Conversions.oklabToLinearSRGB(result)
        
        AssertVectorsEqual(result, exp)
        AssertVectorsEqual(reversed, testLinearRGB)
    }
    
    func testBjörn3() {
        
        let testXYZ = SIMD3<Channel>(0, 1, 0)
        let exp = SIMD3<Channel>(0.922, -0.671, 0.263)

        let testLinearRGB = simd_mul(xyzToLinearRGB, testXYZ)
        let result = Conversions.linearSRGBToOklab(testLinearRGB)
        let reversed = Conversions.oklabToLinearSRGB(result)
        
        AssertVectorsEqual(result, exp)
        AssertVectorsEqual(reversed, testLinearRGB)
    }
    
    func testBjörn4() {
        
        let testXYZ = SIMD3<Channel>(0, 0, 1)
        let exp = SIMD3<Channel>(0.153, -1.415, -0.449)

        let testLinearRGB = simd_mul(xyzToLinearRGB, testXYZ)
        let result = Conversions.linearSRGBToOklab(testLinearRGB)
        let reversed = Conversions.oklabToLinearSRGB(result)
        
        AssertVectorsEqual(result, exp)
        AssertVectorsEqual(reversed, testLinearRGB)
    }
    
}

fileprivate let xyzToLinearRGB = simd_float3x3(rows: [
   SIMD3( 3.2404542, -1.5371385, -0.4985314),
   SIMD3(-0.9692660,  1.8760108,  0.0415560),
   SIMD3( 0.0556434, -0.2040259,  1.0572252)
])
