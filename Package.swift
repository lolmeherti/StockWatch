// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StockWatch",
    platforms:[
        .iOS(.v13), .macOS(.v11), .macCatalyst(.v13), .tvOS(.v13), .watchOS(.v8)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "StockWatch",
            targets: ["StockWatch"]),
        .executable(name: "ExecutableAPI", targets: ["ExecutableAPI"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "StockWatch",
            dependencies: []),
        .executableTarget(name: "ExecutableAPI", dependencies: ["StockWatch"]),
        .testTarget(
            name: "StockWatchTests",
            dependencies: ["StockWatch"]),
    ]
)
