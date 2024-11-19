// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CGALKit",
    platforms: [
        .iOS(.v12),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "CGALKit",
            targets: ["CGALKitSwift", "CGALKitCxx"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.57.0")
    ],
    targets: [
        // Swift target
        .target(
            name: "CGALKitSwift",
            dependencies: [
                "CGALKitCxx"
            ],
            path: "Sources/CGALKit/Swift",
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ],
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
        ),
        
        // C++ target
        .target(
            name: "CGALKitCxx",
            path: "Sources/CGALKit/Cxx",
            publicHeadersPath: "include",
            cxxSettings: [
                .unsafeFlags([
                    "-I", "/usr/local/include",
                    "-I", "/opt/homebrew/opt/boost/include",
                    "-I", "/opt/homebrew/opt/cgal/include",
                ]),
            ],
            linkerSettings: [
                .unsafeFlags([
                    "-L/opt/homebrew/lib",
                    "-L/opt/homebrew/opt/boost/lib",
                    "-L/opt/homebrew/opt/cgal/lib",
                ])]
        ),
        
        // Test target
        .testTarget(
            name: "CGALKitTests",
            dependencies: ["CGALKitSwift"],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
    ],
    cxxLanguageStandard: .cxx17
)
