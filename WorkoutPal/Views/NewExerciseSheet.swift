//
//  NewExerciseSheet.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/28/23.
//

import SwiftUI

struct NewExerciseSheet: View {
    @State private var newExercise = Exercise.emptyExercise
    @Binding var exercises: [Exercise]
    @Binding var isPresentingNewExerciseView: Bool
    
    var body: some View {
        NavigationStack {
            ExerciseEditView(exercise: $newExercise)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewExerciseView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            exercises.append(newExercise)
                            isPresentingNewExerciseView = false
                        }
                    }
                }
        }
    }
}

struct NewExerciseSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewExerciseSheet(exercises: .constant(Workout.sampleData[0].exercies), isPresentingNewExerciseView: .constant(true))
    }
}
