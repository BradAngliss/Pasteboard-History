// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PasteboardUI",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PasteboardUI",
            targets: ["PasteboardUI"]),
    ],
    dependencies: [
        .package(name: "PasteboardProvider", path: "../PasteboardProvider"),
        .package(url: "git@github.com:BradAngliss/Swiftux.git", exact: "0.7.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PasteboardUI",
            dependencies: [
                "Swiftux",
                "PasteboardProvider"
            ]
        ),
        .testTarget(
            name: "PasteboardUITests",
            dependencies: [
                "PasteboardUI"
            ]),
    ]
)
