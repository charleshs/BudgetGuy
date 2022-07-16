// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Models",
    products: [
        .library(
            name: "Models",
            targets: [
                "Models"
            ]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .target(
            name: "Models",
            dependencies: [

            ]
        ),
        .testTarget(
            name: "ModelsTests",
            dependencies: [
                "Models"
            ]
        ),
    ]
)
