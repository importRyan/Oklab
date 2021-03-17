import Foundation

public extension OklabColorPolar {

    /// Mutates hue, with output clamped in 0...2π
    /// - Parameter degrees: Hue in degrees
    mutating func setHueTo(degrees: Channel) {
        var radians = degrees / 180 * .pi
        
        let twoPi = 2 * Channel.pi
        while radians < 0      { radians += twoPi }
        while radians >= twoPi { radians -= twoPi }
        hueRadians = radians
    }
    
    /// Mutates hue, with output clamped in 0...2π
    /// - Parameter degrees: Hue rotation in degrees (positive or negative)
    mutating func setHueRotatedBy(degrees: Channel) {
        let offsetRadians = degrees / 180 * .pi
        var offsetHue = hueRadians + offsetRadians
        
        let twoPi = 2 * Channel.pi
        while offsetHue < 0      { offsetHue += twoPi }
        while offsetHue >= twoPi { offsetHue -= twoPi }
        hueRadians = offsetHue
    }
    
    /// - Parameter degrees: Hue in degrees
    /// - Returns: New color with a shifted hue. The new hue is clamped in 0...2π.
    func withHue(degrees: Channel) -> OklabColorPolar {
        var color = self
        color.setHueTo(degrees: degrees)
        return color
    }
    
    /// - Parameter degrees: Hue rotation in degrees
    /// - Returns: New color with a rotated hue. The new hue is clamped in 0...2π.
    func withHueRotatedBy(degrees: Channel) -> OklabColorPolar {
        var color = self
        color.setHueRotatedBy(degrees: degrees)
        return color
    }
}
