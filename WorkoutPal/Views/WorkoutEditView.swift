//
//  WorkoutEditView.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/29/23.
//

import SwiftUI

struct WorkoutEditView: View {
    @Binding var workout: Workout
    
    var body: some View {
        Form {
            Section(header: Text("Workout Info")){
                TextField("Name", text: $workout.name)
                
                HStack {
                    Text("Estimated Duration:")
                    Picker("Estimated Duration", selection: $workout.estimatedDuration) {
                        ForEach(0..<41) { mins in
                            Text("\(mins * 5)")
                                .tag(mins * 5)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 70, height: 90)
                    
                    Text("Minutes")
                }
                
            }
        }
    }
}

struct WorkoutEditView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutEditView(workout: .constant(Workout.sampleData[0]))
    }
}
