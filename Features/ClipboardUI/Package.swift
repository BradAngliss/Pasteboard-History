// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClipboardUI",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ClipboardUI",
            targets: ["ClipboardUI"]),
    ],
    dependencies: [
        .package(name: "Common", path: "../Common"),
        .package(name: "PasteboardProvider", path: "../PasteboardProvider"),
        .package(name: "Localizable", path: "../Localizable"),
        .package(url: "git@github.com:BradAngliss/Swiftux.git", exact: "0.7.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ClipboardUI",
            dependencies: [
                "Swiftux",
                "Localizable",
                "PasteboardProvider",
                "Common"
            ]
        ),
        .testTarget(
            name: "ClipboardUITests",
            dependencies: ["ClipboardUI"]),
    ]
)
