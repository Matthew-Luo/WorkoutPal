//
//  WorkoutPalApp.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/25/23.
//

import SwiftUI

@main
struct WorkoutPalApp: App {
    @StateObject private var store = WorkoutStore()
    
    var body: some Scene {
        WindowGroup {
            DashBoardView(workouts: $store.workouts) {
                Task {
                    do {
                        try await store.save(workouts: store.workouts)
                    }
                    catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                }
                catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
