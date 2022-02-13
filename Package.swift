// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "AnyCodable",
  products: [
    .library(name: "AnyEncodable", targets: ["AnyEncodable"]),
    .library(name: "AnyDecodable", targets: ["AnyDecodable"]),
    .library(name: "AnyCodable", targets: ["AnyCodable"]),
  ],
  targets: [
    .target(name: "AnyEncodable"),
    .target(name: "AnyDecodable"),
    .target(
      name: "AnyCodable",
      dependencies: [
        "AnyEncodable",
        "AnyDecodable",
      ]),
    .testTarget(
      name: "AnyEncodableTests",
      dependencies: ["AnyEncodable"]),
    .testTarget(
      name: "AnyDecodableTests",
      dependencies: ["AnyDecodable"]),
  ]
)
