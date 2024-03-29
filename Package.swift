// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppHereComponents",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AppHereComponents",
            targets: ["AppHereComponents"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/ArdOnat/CoreModule.git", .exact("1.3.8")),
        .package(name: "Validator", url: "https://github.com/adamwaite/Validator.git", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AppHereComponents",
            dependencies: ["CoreModule", "Validator"]
        ),
        .testTarget(
            name: "AppHereComponentsTests",
            dependencies: ["AppHereComponents"],
            resources: [
                .process("testThemeFile.json")
            ]
        )
    ]
)
