// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwipeableGalleryView",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SwipeableGalleryView",
            targets: ["SwipeableGalleryView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwipeableGalleryView",
            dependencies: []),
        .testTarget(
            name: "SwipeableGalleryViewTests",
            dependencies: ["SwipeableGalleryView"]),
    ]
)
