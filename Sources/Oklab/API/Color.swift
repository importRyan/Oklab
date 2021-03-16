#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, OSX 11, watchOS 6.0, tvOS 13, *)
public extension OklabColor {
    
    init(swiftUI: Color) {
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        self.init(ns: NSColor(swiftUI))
        #else
        self.init(ui: UIColor(swiftUI))
        #endif
    }
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, *)
public extension Color {
    
    init(_ oklab: OklabColor) {
        /// Direct initializer sometimes has floor/ceil issues
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        self.init(NSColor(oklab))
        #else
        self.init(UIColor(oklab))
        #endif
    }
    
    init(_ oklabpolar: OklabColorPolar) {
        /// Direct initializer sometimes has floor/ceil issues
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        self.init(NSColor(oklabpolar))
        #else
        self.init(UIColor(oklabpolar))
        #endif
    }
}
#endif
