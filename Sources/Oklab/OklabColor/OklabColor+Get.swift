import Foundation

public extension OklabColor {
    
    /// - Returns: Float representing chroma (akin to saturation)
    func getChroma() -> Channel {
        sqrt(pow(a, 2) + pow(b, 2))
    }
    
    /// - Returns: Hue angle clamped in 0...2π
    func getHueAngleRadians() -> Channel {
        var radians = atan2(b,a)
        
        let twoPi = 2 * Channel.pi
        while radians < 0 { radians += twoPi }
        while radians >= twoPi { radians -= twoPi }
        return radians
    }
    
    /// - Returns: Hue angle clamped in 0...360
    func getHueAngleDegrees() -> Channel {
        var degrees = getHueAngleRadians() * 180 / .pi
        
        while degrees < 0 { degrees += 360 }
        while degrees > 360 { degrees -= 360 }
        return degrees
    }
    
    func getPolarOklabColor() -> OklabColorPolar {
        OklabColorPolar(self)
    }
}
