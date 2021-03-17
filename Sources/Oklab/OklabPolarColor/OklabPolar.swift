import Foundation

public struct OklabColorPolar {
    
    /// Alpha 0...1
    public var alpha: Channel
    
    /// Perceived lightness
    public var lightness: Channel
    
    ///  Chroma
    public var chroma: Channel
    
    /// Originally set in 0...2π when converted from a cartesian color
    public var hueRadians: Channel
    
    /// Clamped in 0...360
    public var hueDegrees: Channel {
        var degrees = hueRadians * 180 / .pi
        
        while degrees < 0   { degrees += 360 }
        while degrees > 360 { degrees -= 360 }
        return degrees
    }
    
    /// - Parameters:
    ///   - lightness: Perceptual lightness. To achieve pure black or white, also adjust chroma (polar) or a/b channels (cartesian).
    ///   - chroma: Akin to saturation. Describes extent of a and b color channels.
    ///   - hueRadians: Hue angle in radians
    ///   - alpha: Opacity 0...1
    public init(lightness: Channel, chroma: Channel, hueRadians: Channel, alpha: Channel = 1) {
        self.lightness = lightness
        self.chroma = chroma
        self.hueRadians = hueRadians
        self.alpha = alpha
    }
    
    /// - Parameters:
    ///   - lightness: Perceptual lightness. To achieve pure black or white, also adjust chroma (polar) or a/b channels (cartesian).
    ///   - chroma: Akin to saturation. Describes extent of a and b color channels.
    ///   - hueDegrees: Hue angle in degrees
    ///   - alpha: Opacity 0...1
    public init(lightness: Channel, chroma: Channel, hueDegrees: Channel, alpha: Channel = 1) {
        self.lightness = lightness
        self.chroma = chroma
        self.alpha = alpha

        var radians = hueDegrees / 180 * .pi
        let twoPi = 2 * Channel.pi
        while radians < 0      { radians += twoPi }
        while radians >= twoPi { radians -= twoPi }
        self.hueRadians = radians
    }
}

public extension OklabColorPolar {
    
    /// Clamps hue in 0...2π
    init(_ cartesian: OklabColor) {
        self.lightness = cartesian.lightness
        self.chroma = cartesian.getChroma()
        self.hueRadians = cartesian.getHueAngleRadians()
        self.alpha = cartesian.alpha
    }
}

extension OklabColorPolar: Hashable, Equatable, Codable {}
