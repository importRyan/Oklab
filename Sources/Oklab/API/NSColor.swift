#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

public extension OklabColor {
    
    init(ns: NSColor) {
        let (srgb, alpha) = ns.getSRGBComponents()
        let oklab = Conversions.linearSRGBToOklab(srgb.decodeSRGBGamma())
        
        self.L = oklab[0]
        self.a = oklab[1]
        self.b = oklab[2]
        self.alpha = alpha
    }
}

public extension NSColor {
    
    convenience init(_ oklab: OklabColor) {
        let srgb = Conversions.oklabToLinearSRGB(oklab.vector).encodeSRGBGamma()
        self.init(srgbRed: CGFloat(srgb.x),
                  green: CGFloat(srgb.y),
                  blue: CGFloat(srgb.z),
                  alpha: CGFloat(oklab.alpha))
    }
    
    convenience init(_ oklabpolar: OklabColorPolar) {
        let oklab = OklabColor(polar: oklabpolar)
        let srgb = Conversions.oklabToLinearSRGB(oklab.vector).encodeSRGBGamma()
        self.init(srgbRed: CGFloat(srgb.x),
                  green: CGFloat(srgb.y),
                  blue: CGFloat(srgb.z),
                  alpha: CGFloat(oklab.alpha))
    }
}


public extension NSColor {
    
    func getSRGBComponents() -> (color: SIMD3<Channel>, alpha: Channel) {
        guard let color = asValid_sRGBComponentBased()
        else { return (color: .zero, alpha: 0) }
        
        switch color.numberOfComponents {
            case 4...:
                let components = [color.redComponent,
                                  color.greenComponent,
                                  color.blueComponent]
                    .map(Channel.init)
                
                return (color: SIMD3(components),
                        alpha: Channel(color.alphaComponent))
                
            case ...2:
                return (color: SIMD3<Channel>(repeating: Channel(color.whiteComponent)),
                        alpha: Channel(color.alphaComponent))
                
            default: return (color: .zero, alpha: 0)
        }
    }
    
    func asValid_sRGBComponentBased() -> NSColor? {
        guard let rgb = usingType(.componentBased) else { return nil }
        guard rgb.colorSpace == .extendedSRGB || rgb.colorSpace == .sRGB
        else { return rgb.usingColorSpace(.extendedSRGB) }
        return rgb
    }
}
#endif
