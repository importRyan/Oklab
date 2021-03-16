import Foundation

public extension OklabColorPolar {
    
    /// Green/red
    func getA() -> Channel {
        C * cos(h)
    }
    
    /// Blue/yellow
    func getB() -> Channel {
        C * sin(h)
    }
    
    func getOklabCartesianColor() -> OklabColor {
        OklabColor(polar: self)
    }
}
