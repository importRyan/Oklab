import Foundation

public extension OklabColorPolar {
    
    /// - Returns: Green/red channel
    func getA() -> Channel {
        chroma * cos(hueRadians)
    }
    
    /// - Returns: Blue/yellow channel
    func getB() -> Channel {
        chroma * sin(hueRadians)
    }
}
