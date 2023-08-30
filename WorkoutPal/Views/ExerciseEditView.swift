//
//  ExerciseEditView.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/25/23.
//

import SwiftUI

struct ExerciseEditView: View {
    @Binding var exercise: Exercise
    
    var body: some View {
        Form {
            Section(header: Text("Exercise Info")){
                TextField("Name", text: $exercise.name)
                
                Picker("Sets", selection: $exercise.sets) {
                    ForEach(1...10, id: \.self) { numSets in
                        Text("\(numSets)")
                    }
                }
                
                Picker("Reps", selection: $exercise.reps) {
                    ForEach(1...20, id: \.self) { numReps in
                        Text("\(numReps)")
                    }
                }
                
                HStack {
                    Text("Weight")
                    Picker("Weight", selection: $exercise.weight) {
                        ForEach(0..<101) { weight in
                            Text("\(weight * 5) lbs")
                                .tag(weight * 5)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 100)
                }
                
                Picker("RPE", selection: $exercise.rpe) {
                    ForEach(1...10, id: \.self) { rpe in
                        Text("\(rpe)")
                    }
                }
                
                Picker("Rest Time", selection: $exercise.restTimeInMinutes) {
                    ForEach(1...10, id: \.self) { restTime in
                        Text("\(restTime)")
                    }
                }
            }
        }
    }
}

struct ExerciseEditView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseEditView(exercise: .constant(Exercise.sampleData[0]))
    }
}
