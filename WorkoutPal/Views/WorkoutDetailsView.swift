//
//  WorkoutDetailsView.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/25/23.
//

import SwiftUI

struct WorkoutDetailsView: View {
    @Binding var workout: Workout
    @State private var editingWorkout = Workout.emptyWorkout
    @State private var isPresentingWorkoutEditView = false
    
    @State private var isPresentingNewExerciseView = false
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Estimated Duration: \(workout.estimatedDuration)")
                }
                Spacer()
            }
            .padding()
                
            List($workout.exercies) { $exercise in
                NavigationLink(destination: ExerciseDetailsView(exercise: $exercise)) {
                    ExerciseCardView(exercise: exercise)
                }
            }
            .navigationTitle(workout.name)
            .toolbar {
                Button("Edit") {
                    isPresentingWorkoutEditView = true
                    editingWorkout = workout
                }
                Button(action: {
                    isPresentingNewExerciseView = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresentingWorkoutEditView) {
            NavigationStack {
                WorkoutEditView(workout: $editingWorkout)
                    .navigationTitle(workout.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingWorkoutEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                isPresentingWorkoutEditView = false
                                workout = editingWorkout
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $isPresentingNewExerciseView) {
            NewExerciseSheet(exercises: $workout.exercies, isPresentingNewExerciseView: $isPresentingNewExerciseView)
        }
    }
}

struct WorkoutDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailsView(workout: .constant(Workout.sampleData[0]))
    }
}
