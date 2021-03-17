import Foundation

/// D65 Whitepoint
public struct OklabColor {

    /// Perceptual lightness. To achieve pure black or white, also adjust chroma (polar) or a/b channels (cartesian).
    public var lightness: Channel
    
    /// Green to red. Range varies. Could span about -0.6...0.6 in medium brightness.
    public var a: Channel
    
    /// Yellow to blue. Range varies. Could span about -0.55...0.8 in medium brightness.
    public var b: Channel
    
    /// Opacity 0...1
    public var alpha: Channel
    
    /// Vector construct of Lab channels for SIMD-based calculations
    public var vector: SIMD3<Channel> {
        SIMD3<Channel>(lightness, a, b)
    }
    
    /// - Parameters:
    ///   - lightness: Perceptual lightness. To achieve pure black or white, also adjust chroma (polar) or a/b channels (cartesian).
    ///   - a: Green to red. Range varies. Could span about -0.6...0.6 in medium brightness.
    ///   - b: Yellow to blue. Range varies. Could span about -0.55...0.8 in medium brightness.
    ///   - alpha: Opacity 0...1
    ///
    public init(lightness: Channel, a: Channel, b: Channel, alpha: Channel = 1) {
        self.lightness = lightness
        self.a = a
        self.b = b
        self.alpha = alpha
    }
}

public extension OklabColor {

    init(_ polar: OklabColorPolar) {
        self.lightness = polar.lightness
        self.a = polar.getA()
        self.b = polar.getB()
        self.alpha = polar.alpha
    }
}

extension OklabColor: Hashable, Equatable, Codable {}
