# Swift Network Observer Library

## Check Internet Connectivity iOS 13+

> [!TIP]
> import SwiftNetworkObserver

Example:

import SwiftUI
import SwiftNetworkObserver

@main
struct PROJECT_NameApp: App {

    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}

In ContentView.swift

import SwiftUI
import SwiftNetworkObserver

struct ContentView: View {
    
    @EnvironmentObject private var networkMonitor: NetworkMonitor
    
    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                Text("Connected")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            } else {
                Text("Disconnected")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
        }
    }
}

