//
//  NewWorkoutSheet.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/29/23.
//

import SwiftUI

struct NewWorkoutSheet: View {
    @State private var newWorkout = Workout.emptyWorkout
    @Binding var workouts: [Workout]
    @Binding var isPresentingNewWorkoutView: Bool
    
    var body: some View {
        NavigationStack {
            WorkoutEditView(workout: $newWorkout)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewWorkoutView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            workouts.append(newWorkout)
                            isPresentingNewWorkoutView = false
                        }
                    }
                }
        }
    }
}

struct NewWorkoutSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutSheet(workouts: .constant(Workout.sampleData), isPresentingNewWorkoutView: .constant(true))
    }
}
