//
//  Exercise .swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/25/23.
//

import Foundation

struct Exercise: Identifiable, Codable {
    let id: UUID
    var name: String
    var sets: Int
    var reps: Int
    var weight: Int
    var rpe: Int
    var restTimeInMinutes: Int
    
    init(id: UUID = UUID(), name: String, sets: Int, reps: Int, weight: Int, rpe: Int, restTimeInMinutes: Int) {
        self.id = id
        self.name = name
        self.sets = sets
        self.reps = reps
        self.weight = weight
        self.rpe = rpe
        self.restTimeInMinutes = restTimeInMinutes
    }
    
    static var emptyExercise: Exercise {
        Exercise(name: "", sets: 0, reps: 0, weight: 0, rpe: 0, restTimeInMinutes: 0)
    }
}

extension Exercise {
    static let sampleData: [Exercise] =
    [
        Exercise(name: "Squats",
                 sets: 4,
                 reps: 5,
                 weight: 200,
                 rpe: 7,
                 restTimeInMinutes: 5),
        Exercise(name: "Bench",
                 sets: 4,
                 reps: 5,
                 weight: 100,
                 rpe: 8,
                 restTimeInMinutes: 4),
        Exercise(name: "Deadlift",
                 sets: 4,
                 reps: 3,
                 weight: 300,
                 rpe: 7,
                 restTimeInMinutes: 6)
    ]
}


