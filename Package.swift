import PackageDescription

let package = Package(
  name: "Environment",
  exclude: [],
  targets: [
    Target(
      name: "Environment"
    ),
    Target(
      name: "EnvironmentTests",
      dependencies: [
        .Target(name: "Environment")
      ]
    )
  ]
)