// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "AnyEncodable",
  products: [
    .library(name: "AnyEncodable", targets: ["AnyEncodable"]),
  ],
  targets: [
    .target(
      name: "AnyEncodable",
      dependencies: []),
    .testTarget(
      name: "AnyEncodableTests",
      dependencies: ["AnyEncodable"]),
  ]
)
