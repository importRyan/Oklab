import Foundation

public struct OklabColorPolar {
    
    /// Perceived lightness
    public var L: Channel
    
    ///  Chroma
    public var C: Channel
    
    /// Hue angle in radians
    public var h: Channel
    
    /// Alpha 0...1
    public var alpha: Channel
    
    public var hueDegrees: Channel {
        abs((h * 180 / .pi) - 360)
    }
}

public extension OklabColorPolar {
    
    init(lightness: Channel, chroma: Channel, hue: Channel, alpha: Channel = 1) {
        self.L = lightness
        self.C = chroma
        self.h = hue
        self.alpha = alpha
    }
    
    init(_ Lab: OklabColor) {
        self.L = Lab.L
        self.C = Lab.getChroma()
        self.h = Lab.getHueAngleRadians()
        self.alpha = Lab.alpha
    }
}

extension OklabColorPolar: Hashable, Equatable, Codable {}
