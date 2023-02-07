// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLTokenHandler",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MLTokenHandler",
            targets: ["MLTokenHandler"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MLTokenHandler",
            dependencies: []),
        .testTarget(
            name: "MLTokenHandlerTests",
            dependencies: ["MLTokenHandler"]),
    ]
)
