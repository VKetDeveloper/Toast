// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "VketToast",
    platforms: [
        .iOS(.v16)
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
            path: "Sources/VketToast"
        )
    ]
)
