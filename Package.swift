// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "StoreKitClient",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "StoreKitClient",
            targets: ["StoreKitClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "StoreKitClient",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "DependenciesMacros", package: "swift-dependencies"),
            ],
            path: "Sources/StoreKitClient"
        ),
    ]
)
