import Foundation

/// D65 Whitepoint
public struct OklabColor {

    /// Perceived lightness
    public var L: Channel
    
    /// Green/red
    public var a: Channel
    
    /// Yellow/blue
    public var b: Channel
    
    /// Alpha 0...1
    public var alpha: Channel
    
    /// Vector construct of Lab channels
    public var vector: SIMD3<Channel> {
        SIMD3<Channel>(L, a, b)
    }
}

public extension OklabColor {
    
    init(lightness: Channel, a: Channel, b: Channel, alpha: Channel = 1) {
        self.L = lightness
        self.a = a
        self.b = b
        self.alpha = alpha
    }
    
    init(polar: OklabColorPolar) {
        self.L = polar.L
        self.a = polar.getA()
        self.b = polar.getB()
        self.alpha = polar.alpha
    }
}

extension OklabColor: Hashable, Equatable, Codable {}
