import Foundation

internal extension SIMD3 where Scalar == Channel {
    
    func decodeSRGBGamma() ->  SIMD3<Channel> {
        let compressed = clamped01()
        let linear = SIMD3(compressed[0].decode(),
                           compressed[1].decode(),
                           compressed[2].decode())
        return linear.clamped01()
    }
}

internal extension SIMD3 where Scalar == Channel {
    
    func encodeSRGBGamma() -> SIMD3<Channel> {
        let linear = clamped01()
        let srgb = SIMD3(linear[0].encode(),
                         linear[1].encode(),
                         linear[2].encode())
        return srgb.clamped01()
    }
}

fileprivate extension Channel {
    
    func decode() -> Channel {
        guard self > gamma.k_04045
        else { return self / gamma.k12_92 }
        let shiftedScaled = (self + gamma.k_055) / gamma.k1_055
        return pow(shiftedScaled, gamma.k2_4)
    }
    
    func encode() -> Channel {
        guard self > gamma.k_0031308
        else { return self * gamma.k12_92 }
        let power = pow(self, gamma.k_416x)
        return gamma.k1_055 * power - gamma.k_055
    }
    
    struct gamma {
        static let k_04045: Channel = 0.04045
        static let k12_92: Channel = 12.92
        static let k_055: Channel = 0.055
        static let k1_055: Channel = 1.055
        static let k2_4: Channel = 2.4
        
        static let k_0031308: Channel = 0.0031308
        static let k_416x: Channel = 0.41666666666
    }
}
