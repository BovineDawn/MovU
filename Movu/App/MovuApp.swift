//
//  MovuApp.swift
//  Movu
//
//  Created by JG on 7/30/25.
//

import SwiftUI

@main
struct MovuApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
