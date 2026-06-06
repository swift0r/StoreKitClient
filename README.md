# StoreKitClient

A lightweight [swift-dependencies](https://github.com/pointfreeco/swift-dependencies) client for requesting App Store reviews via StoreKit.

## Requirements

- iOS 17+
- Swift 6

## Installation

Add the package via Swift Package Manager in `Package.swift`:

```swift
.package(url: "https://github.com/swift0r/StoreKitClient", from: "1.0.0"),
```

Then add it as a dependency to your target:

```swift
.target(
    name: "MyTarget",
    dependencies: [
        .product(name: "StoreKitClient", package: "StoreKitClient"),
    ]
),
```

## Usage

Inject `StoreKitClient` via the `@Dependency` property wrapper:

```swift
import StoreKitClient
import Dependencies

struct MyFeature {
    @Dependency(\.storeKitClient) var storeKit

    func userCompletedAction() async {
        await storeKit.requestReview()
    }
}
```

### Testing

The library ships with a `testValue` that no-ops by default, so no StoreKit dialogs appear in unit tests:

```swift
withDependencies {
    $0.storeKitClient = .noop
} operation: {
    // your test
}
```

## License

MIT — see [LICENSE](LICENSE).
