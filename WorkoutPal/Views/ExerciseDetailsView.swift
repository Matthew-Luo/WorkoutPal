//
//  ExerciseDetailsView.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/25/23.
//

import SwiftUI

struct ExerciseDetailsView: View {
    @Binding var exercise: Exercise
    @State private var editingExercise = Exercise.emptyExercise
    @State private var isPresentingExerciseEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Exercise Info")) {
                Text("Sets: \(exercise.sets)")
                Text("Reps: \(exercise.reps)")
                Text("Weight: \(exercise.weight)lbs")
                Text("RPE: \(exercise.rpe)")
                Text("Rest Time: \(exercise.restTimeInMinutes) minutes")
            }
        }
        .navigationTitle(exercise.name)
        .toolbar {
            Button("Edit") {
                isPresentingExerciseEditView = true
                editingExercise = exercise
            }
        }
        
        .sheet(isPresented: $isPresentingExerciseEditView) {
            NavigationStack {
                ExerciseEditView(exercise: $editingExercise)
                    .navigationTitle(exercise.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingExerciseEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                isPresentingExerciseEditView = false
                                exercise = editingExercise
                            }
                        }
                    }
            }
        }
    }
}

struct ExerciseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailsView(exercise: .constant(Exercise.sampleData[0]))
    }
}
