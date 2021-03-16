// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Oklab",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13),
        .tvOS(.v10),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Oklab",
            targets: ["Oklab"]),
    ],
    targets: [
        .target(
            name: "Oklab",
            dependencies: []),
        .testTarget(
            name: "OklabTests",
            dependencies: ["Oklab"]),
    ]
)
