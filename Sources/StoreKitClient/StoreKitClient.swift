// Copyright © 2026 Dr. Stefan Lahme. All rights reserved.

import Dependencies
import DependenciesMacros
import StoreKit
import UIKit

@DependencyClient
public struct StoreKitClient: Sendable {
    public var requestReview: @Sendable () async -> Void
}

extension StoreKitClient: DependencyKey {
    public static let liveValue = Self(
        requestReview: {
            await MainActor.run {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    AppStore.requestReview(in: windowScene)
                }
            }
        }
    )
}

extension StoreKitClient: TestDependencyKey {
    public static let testValue = Self()
    public static let previewValue = Self.noop
}

public extension StoreKitClient {
    static let noop = Self(requestReview: {})
}

public extension DependencyValues {
    var storeKitClient: StoreKitClient {
        get { self[StoreKitClient.self] }
        set { self[StoreKitClient.self] = newValue }
    }
}
