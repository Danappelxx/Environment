import PackageDescription

let package = Package(
  name: "Environment",
  targets: [Target(name: "Environment", dependencies: ["CEnvironment"])]
)