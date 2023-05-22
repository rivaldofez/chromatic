// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "chromatic",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "chromatic",
            targets: ["AppModule"],
            bundleIdentifier: "com.chromatic",
            teamIdentifier: "3F8C4P2T95",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .smiley),
            accentColor: .presetColor(.yellow),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-cocoa", .branch("master"))
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "Realm", package: "realm-cocoa"),
                .product(name: "RealmSwift", package: "realm-cocoa")
            ],
            path: "."
        )
    ]
)