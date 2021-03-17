#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#else
import UIKit
#endif

#if canImport(AppKit) || canImport(UIKit)

public extension OklabColor {
    
    /// - Parameter srgbCI: CIColor in the sRGB color space
    init(srgbCI: CIColor) {
        let vector = SIMD3(Channel(srgbCI.red), Channel(srgbCI.blue), Channel(srgbCI.green))
        let oklab = Conversions.linearSRGBToOklab(vector.decodeSRGBGamma())
        
        self.lightness = oklab[0]
        self.a = oklab[1]
        self.b = oklab[2]
        self.alpha = Channel(srgbCI.alpha)
    }
}

public extension OklabColorPolar {

    /// - Parameter srgbCI: CIColor in the sRGB color space
    init(srgbCI: CIColor) {
        self.init(OklabColor(srgbCI: srgbCI))
    }
}

public extension CIColor {

    /// Creates a CIColor in the extended sRGB color space
    convenience init?(_ oklab: OklabColor) {
        let srgb = Conversions.oklabToLinearSRGB(oklab.vector).encodeSRGBGamma()
        self.init(red: CGFloat(srgb.x),
                green: CGFloat(srgb.y),
                blue: CGFloat(srgb.z),
                alpha: CGFloat(oklab.alpha),
                colorSpace: esrgb)
    }
    
    /// Creates a CIColor in the extended sRGB color space
    convenience init?(_ polar: OklabColorPolar) {
        self.init(OklabColor(polar))
    }
}


#endif
