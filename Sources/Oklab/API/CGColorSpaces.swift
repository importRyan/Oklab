#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#else
import UIKit
#endif

internal let esrgb = CGColorSpace(name: CGColorSpace.extendedSRGB)!
internal let srgb = CGColorSpace(name: CGColorSpace.extendedSRGB)!
