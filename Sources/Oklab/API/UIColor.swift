#if canImport(UIKit)
import UIKit

public extension OklabColor {
    
    init(ui: UIColor) {
        let (srgb, alpha) = ui.getSRGBComponents()
        let oklab = Conversions.linearSRGBToOklab(srgb.decodeSRGBGamma())
        
        self.L = oklab[0]
        self.a = oklab[1]
        self.b = oklab[2]
        self.alpha = alpha
    }
}

public extension UIColor {
    
    convenience init(_ oklab: OklabColor) {
        let srgb = Conversions.oklabToLinearSRGB(oklab.vector).encodeSRGBGamma()
        self.init(red: CGFloat(srgb.x),
                  green: CGFloat(srgb.y),
                  blue: CGFloat(srgb.z),
                  alpha: CGFloat(oklab.alpha))
    }
    
    convenience init(_ oklabpolar: OklabColorPolar) {
        let oklab = OklabColor(polar: oklabpolar)
        let srgb = Conversions.oklabToLinearSRGB(oklab.vector).encodeSRGBGamma()
        self.init(red: CGFloat(srgb.x),
                  green: CGFloat(srgb.y),
                  blue: CGFloat(srgb.z),
                  alpha: CGFloat(oklab.alpha))
    }
}

public extension UIColor {
    
    func getSRGBComponents() -> (color: SIMD3<Channel>, alpha: Channel) {
        self.cgColor.getSRGBComponents()
    }
}

#endif
