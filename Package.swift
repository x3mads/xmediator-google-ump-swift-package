// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "XMediatorGoogleUMP",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "XMediatorGoogleUMP", targets: ["XMediatorGoogleUMPTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "3.1.0"..<"4.0.0"),
        .package(url: "https://github.com/x3mads/xmediator-swift-package.git", .upToNextMajor(from: "1.177.0")),
    ],
    targets: [
        .target(
            name: "XMediatorGoogleUMPTarget",
            dependencies: [
                .target(name: "XMediatorGoogleUMP"),
                .product(name: "XMediator", package: "xmediator-swift-package"),
                .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
            ],
            path: "XMediatorGoogleUMPTarget",
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("UIKit"),
            ]
        ),
        .binaryTarget(
            name: "XMediatorGoogleUMP",
            url: "https://ios-artifact-registry.x3mads.com/cocoapods/XMediatorGoogleUMP/XMediatorGoogleUMP-3.1.0.1.zip",
            checksum: "b9b51913836486f4f76c16cb835d0a8743c56b87ef1625330854294e3a36a883"
        ),
    ]
)
