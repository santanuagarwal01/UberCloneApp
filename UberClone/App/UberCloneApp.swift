//
//  UberCloneApp.swift
//  UberClone
//
//  Created by Santanu Agarwal on 22/11/22.
//

import SwiftUI

@main
struct UberCloneApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
