import Foundation

internal extension Channel {
    func clamped01() -> Self {
        guard self.isFinite else {
            return self.isInfinite
                ? ( self > 0 ? 1 : 0 )
                : 0
        }
        return max(0, min(1, self))
    }
}

internal extension SIMD3 where Scalar == Channel {
    func clamped01() -> Self {
        self.clamped(lowerBound: .zero, upperBound: .one)
    }
}
