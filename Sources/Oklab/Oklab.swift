import Foundation

/// More convenient initializers exist. This is just "autocomplete documentation".
public struct Oklab { private init() {} }

#if !os(watchOS)
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, OSX 11, watchOS 6.0, tvOS 13, *)
public extension Oklab {
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
public extension Oklab {
    func convert(ui: UIColor) -> OklabColor {
        OklabColor(ui: ui)
    }
}
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
public extension Oklab {

    func convert(ns: NSColor) -> OklabColor {
        OklabColor(ns: ns)
    }
    
}
#endif

#if canImport(AppKit) || canImport(UIKit)
public extension Oklab {
    
    func convert(srgbCG: CGColor) -> OklabColor {
        OklabColor(cg: srgbCG)
    }
    
    #if !os(watchOS)
    func convert(srgbCI: CIColor) -> OklabColor {
        OklabColor(srgbCI: srgbCI)
    }
    #endif
}
#endif
#endif
