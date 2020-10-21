// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MAPI",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MAPI",
            targets: ["MAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hughbe/DataStream", from: "1.1.1"),
        .package(url: "https://github.com/hughbe/WindowsDataTypes", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MAPI",
            dependencies: ["DataStream", "WindowsDataTypes"]),
        .testTarget(
            name: "MAPITests",
            dependencies: ["MAPI"]),
    ]
)
