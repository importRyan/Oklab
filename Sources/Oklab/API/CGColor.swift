#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#else
import UIKit
#endif

#if canImport(AppKit) || canImport(UIKit)
public extension OklabColor {
    
    /// CGColor uses a static func `makeFromOklab` for the return trip.
    init(cg: CGColor) {
        let (srgb, alpha) = cg.getSRGBComponents()
        let oklab = Conversions.linearSRGBToOklab(srgb.decodeSRGBGamma())
        
        self.lightness = oklab[0]
        self.a = oklab[1]
        self.b = oklab[2]
        self.alpha = alpha
    }
}

public extension OklabColorPolar {
    
    /// CGColor uses a static func `makeFromOklabPolar` for the return trip.
    init(cg: CGColor) {
        self.init(OklabColor(cg: cg))
    }
}

public extension CGColor {
    
    static func makeFromOklab(_ oklab: OklabColor) -> CGColor? {
        let srgb = Conversions.oklabToLinearSRGB(oklab.vector).encodeSRGBGamma()
        let components = [srgb.x, srgb.y, srgb.z, oklab.alpha].map { CGFloat($0) }
        return CGColor(colorSpace: esrgb, components: components)
    }
    
    static func makeFromOklabPolar(_ polar: OklabColorPolar) -> CGColor? {
        makeFromOklab(OklabColor(polar))
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
