// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WatchLogger",
    platforms: [.watchOS(.v6)],
    products: [.library(name: "WatchLogger", targets: ["WatchLogger"])],
    targets: [.target(name: "WatchLogger", dependencies: [])],
    swiftLanguageVersions: [.v5]
)
