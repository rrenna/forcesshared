// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "forcesshared",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Shared",
            targets: ["Shared"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Shared",
            dependencies: [],
            swiftSettings: [
                .enableUpcomingFeature("ConciseMagicFile"),
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ExistentialAny")
            ]),
        .testTarget(
            name: "SharedTests",
            dependencies: ["Shared"]),
    ],
    swiftLanguageModes: [.v5]
)
