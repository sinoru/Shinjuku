// swift-tools-version:5.0
//
//  Package.swift
//  Shinjuku
//
//  Created by Jaehong Kang on 12/04/2019.
//  Copyright © 2019 Jaehong Kang. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import PackageDescription

let package = Package(
    name: "Shinjuku",
    platforms: [
    	.macOS(.v10_10), .iOS(.v9), .watchOS(.v2), .tvOS(.v9)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Shinjuku",
            targets: ["Shinjuku"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Shinjuku",
            dependencies: []),
        .testTarget(
            name: "ShinjukuTests",
            dependencies: ["Shinjuku"]),
    ]
)
