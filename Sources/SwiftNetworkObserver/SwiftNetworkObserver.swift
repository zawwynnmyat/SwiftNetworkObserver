// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI
import Network

public class NetworkMonitor: ObservableObject, @unchecked Sendable {
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    @Published public var isConnected = false

    public init() {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
