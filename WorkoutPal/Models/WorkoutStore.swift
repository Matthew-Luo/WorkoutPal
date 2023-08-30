//
//  WorkoutStore.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/29/23.
//

import SwiftUI

@MainActor
class WorkoutStore: ObservableObject {
    @Published var workouts: [Workout] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("workouts.data")
    }
    
    func load() async throws {
        let task = Task<[Workout], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            
            let tempWorkouts = try JSONDecoder().decode([Workout].self, from: data)
            return tempWorkouts
        }
        let workouts = try await task.value
        self.workouts = workouts
    }
    
    func save(workouts: [Workout]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(workouts)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        
        _ = try await task.value
    }
}
