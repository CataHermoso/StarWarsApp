//
//  flutterApp.swift
//  flutter
//
//  Created by Catalina Hermoso on 14/10/2022.
//

import SwiftUI

@main
struct flutterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(page: api().viewModel.$page)
        }
    }
}
