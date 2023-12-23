// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChineseCompatibilitiesWithAges",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ChineseCompatibilitiesWithAges",
            targets: ["ChineseCompatibilitiesWithAges"]),
    ],
    dependencies: [
        .package(url: "https://github.com/theevo/SexagenaryCycle1924.git", from: "1.0.1"),
        .package(url: "https://github.com/theevo/ChineseZodiacCompatibility.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ChineseCompatibilitiesWithAges",
            dependencies: [
                .product(name: "SexagenaryCycle1924", package: "SexagenaryCycle1924"),
                .product(name: "ChineseZodiacCompatibility", package: "ChineseZodiacCompatibility"),
            ]
        ),
        .testTarget(
            name: "ChineseCompatibilitiesWithAgesTests",
            dependencies: ["ChineseCompatibilitiesWithAges"]),
    ]
)
