#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#else
import UIKit
#endif

#if canImport(AppKit) || canImport(UIKit)
public extension OklabColor {
    
    init(cg: CGColor) {
        let (srgb, alpha) = cg.getSRGBComponents()
        let oklab = Conversions.linearSRGBToOklab(srgb.decodeSRGBGamma())
        
        self.L = oklab[0]
        self.a = oklab[1]
        self.b = oklab[2]
        self.alpha = alpha
    }
}

public extension CGColor {
    
    func makeFromOklab(_ oklab: OklabColor) -> CGColor? {
        let srgb = Conversions.oklabToLinearSRGB(oklab.vector).encodeSRGBGamma()
        let components = [srgb.x, srgb.y, srgb.z, oklab.alpha].map(CGFloat.init)
        return CGColor(colorSpace: esrgb, components: components)
    }
}

internal extension CGColor {
    
    func getSRGBComponents() -> (color: SIMD3<Channel>, alpha: Channel) {
        
        guard let components = asValid_sRGB()?.components?.map(Channel.init),
              components.count == 4
        else { return (color: .zero, alpha: 0) }
        
        return (color: SIMD3(components[0...2]),
                alpha: Channel(components[3]))
    }
    
    func asValid_sRGB() -> CGColor? {
        colorSpace == srgb || colorSpace == esrgb
            ? self
            : converted(to: srgb,
                        intent: .defaultIntent,
                        options: nil)
    }
}
#endif
