//
//  Workout.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/25/23.
//

import Foundation

struct Workout: Identifiable, Codable {
    let id: UUID
    var name: String
    var exercies: [Exercise]
    var estimatedDuration: Int
    
    init(id: UUID = UUID(), name: String, exercies: [Exercise], estimatedDuration: Int) {
        self.id = id
        self.name = name
        self.exercies = exercies
        self.estimatedDuration = estimatedDuration
        
//        var estimate = 0
//        for exercise in self.exercies {
//            estimate += exercise.sets * exercise.restTimeInMinutes
//        }
//
//        self.estimatedDuration = estimate
    }
    
    static var emptyWorkout: Workout {
        Workout(name: "", exercies: [], estimatedDuration: 0)
    }
}


extension Workout {
    static let sampleData: [Workout] =
    [
        Workout(name: "Lower Body",
                exercies: [
                    Exercise(name: "Squats",
                             sets: 4,
                             reps: 5,
                             weight: 200,
                             rpe: 7,
                             restTimeInMinutes: 5),
                    Exercise(name: "Deadlift",
                             sets: 4,
                             reps: 3,
                             weight: 300,
                             rpe: 7,
                             restTimeInMinutes: 6)
                ],
                estimatedDuration: 60),
        Workout(name: "Upper Body",
                exercies: [
                    Exercise(name: "Bench",
                             sets: 4,
                             reps: 5,
                             weight: 100,
                             rpe: 8,
                             restTimeInMinutes: 4),
                    Exercise(name: "Shoulder Press",
                             sets: 3,
                             reps: 10,
                             weight: 50,
                             rpe: 9,
                             restTimeInMinutes: 3)
                ],
                estimatedDuration: 40)
    ]
}
