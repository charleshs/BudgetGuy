// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "BGUtils",
    products: [
        .library(
            name: "BGUtils",
            targets: [
                "BGUtils",
            ]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .target(
            name: "BGUtils",
            dependencies: [
                
            ]
        ),
        .testTarget(
            name: "BGUtilsTests",
            dependencies: [
                "BGUtils",
            ]
        ),
    ]
)
