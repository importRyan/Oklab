import Foundation

/// Convenience initializers exist. These are just "autocomplete documentation".
struct Oklab { private init() {} }

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, OSX 11, watchOS 6.0, tvOS 13, *)
extension Oklab {
    func convert(swiftUI: Color) -> OklabColor {
        OklabColor(swiftUI: swiftUI)
    }
}
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#else
import UIKit
#endif

#if canImport(UIKit)
extension Oklab {
    func convert(ui: UIColor) -> OklabColor {
        OklabColor(ui: ui)
    }
}
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
extension Oklab {

    func convert(ns: NSColor) -> OklabColor {
        OklabColor(ns: ns)
    }
    
}
#endif

#if canImport(AppKit) || canImport(UIKit)
extension Oklab {
    
    func convert(srgbCG: CGColor) -> OklabColor {
        OklabColor(cg: srgbCG)
    }
    
    func convert(srgbCI: CIColor) -> OklabColor {
        OklabColor(srgbCI: srgbCI)
    }
}
#endif
