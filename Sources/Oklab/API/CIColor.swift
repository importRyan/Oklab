#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#else
import UIKit
#endif

#if canImport(AppKit) || canImport(UIKit)

public extension OklabColor {
    
    init(srgbCI: CIColor) {
        let vector = SIMD3(Channel(srgbCI.red), Channel(srgbCI.blue), Channel(srgbCI.green))
        let oklab = Conversions.linearSRGBToOklab(vector.decodeSRGBGamma())
        
        self.L = oklab[0]
        self.a = oklab[1]
        self.b = oklab[2]
        self.alpha = Channel(srgbCI.alpha)
    }
}

public extension CIColor {
    
    convenience init?(_ oklab: OklabColor) {
        let srgb = Conversions.oklabToLinearSRGB(oklab.vector).encodeSRGBGamma()
        self.init(red: CGFloat(srgb.x),
                green: CGFloat(srgb.y),
                blue: CGFloat(srgb.z),
                alpha: CGFloat(oklab.alpha),
                colorSpace: esrgb)
    }
}

#endif
