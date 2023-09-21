// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Superagent Legacy",
	platforms: [.iOS(.v15), .macOS(.v12), .tvOS(.v15), .watchOS(.v8)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Superagent Legacy",
            targets: ["Superagent Legacy"]),
    ],
	targets: [
			.target(
				name: "Superagent Legacy"),
			.testTarget(
				name: "SuperagentTests",
				dependencies: ["Superagent Legacy"]),
		]
)


	
