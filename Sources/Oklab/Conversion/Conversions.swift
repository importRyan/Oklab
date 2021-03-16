import Foundation
import simd

public struct Conversions {
    
    private init() {}
    
    public static func linearSRGBToOklab(_ rgb: SIMD3<Channel>) -> SIMD3<Channel> {
        let lms = simd_mul(matrixLinearRGBToLMS, rgb)
        let nonlinearity = SIMD3(cbrtf(lms.x), cbrtf(lms.y), cbrtf(lms.z))
        return simd_mul(matrixLMSToOklab, nonlinearity)
    }
    
    public static func oklabToLinearSRGB(_ oklab: SIMD3<Channel>) -> SIMD3<Channel> {
        let lms = simd_mul(matrixOklabToLMS, oklab)
        let nonlinearity = SIMD3(powf(lms.x, 3), powf(lms.y, 3), powf(lms.z, 3))
        return simd_mul(matrixLMSToLinearRGB, nonlinearity)
    }
    
    public static let matrixLinearRGBToLMS  = simd_float3x3(rows: [
        SIMD3(0.4122214708, 0.5363325363, 0.0514459929),
        SIMD3(0.2119034982, 0.6806995451, 0.1073969566),
        SIMD3(0.0883024619, 0.2817188376, 0.6299787005)
    ])
    
    public static let matrixLMSToOklab = simd_float3x3(rows: [
        SIMD3(0.2104542553,  0.7936177850, -0.0040720468),
        SIMD3(1.9779984951, -2.4285922050,  0.4505937099),
        SIMD3(0.0259040371,  0.7827717662, -0.8086757660)
    ])
    
    public static let matrixOklabToLMS = simd_float3x3(rows: [
        SIMD3(1,  0.3963377774,  0.2158037573),
        SIMD3(1, -0.1055613458, -0.0638541728),
        SIMD3(1, -0.0894841775, -1.2914855480)
    ])
    
    public static let matrixLMSToLinearRGB = simd_float3x3(rows: [
        SIMD3( 4.0767416621, -3.3077115913,  0.2309699292),
        SIMD3(-1.2684380046,  2.6097574011, -0.3413193965),
        SIMD3(-0.0041960863, -0.7034186147,  1.7076147010)
    ])
}
