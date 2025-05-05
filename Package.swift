// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "VketToast",
    platforms: [
        .iOS(.v16),
        .visionOS(.v1),
        .macCatalyst(.v15),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "VketToast",
            targets: ["VketToast"]
        ),
    ],
    targets: [
        .target(
            name: "VketToast",
            path: "Sources/Toast",
            resources: [
                // 必要に応じてアセットなどを含める
                // .process("Resources")
            ]
        ),
        .testTarget(
            name: "VketToastTests",
            dependencies: ["VketToast"],
            path: "Tests/ToastTests"
        ),
    ]
)
