import Foundation

public extension OklabColor {

    func getChroma() -> Channel {
        pow( pow(a, 2) + pow(b, 2) , 0.5)
    }
    
    func getHueAngleRadians() -> Channel {
        atan2(b,a)
    }
    
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
