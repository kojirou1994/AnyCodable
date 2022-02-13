// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "AnyEncodable",
  products: [
    .library(name: "AnyEncodable", targets: ["AnyEncodable"]),
    .library(name: "AnyDecodable", targets: ["AnyDecodable"]),
  ],
  targets: [
    .target(name: "AnyEncodable"),
    .target(name: "AnyDecodable"),
    .target(
    .testTarget(
      name: "AnyEncodableTests",
      dependencies: ["AnyEncodable"]),
    .testTarget(
      name: "AnyDecodableTests",
      dependencies: ["AnyDecodable"]),
  ]
)
