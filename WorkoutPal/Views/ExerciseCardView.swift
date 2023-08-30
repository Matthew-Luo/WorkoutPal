//
//  ExerciseCardView.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/25/23.
//

import SwiftUI

struct ExerciseCardView: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(exercise.name)
                .font(.headline)
            Spacer()
            HStack {
                Text("\(exercise.sets) X \(exercise.reps)")
                Text("\(exercise.weight)lbs")
                
                Spacer()
                Text("RPE: \(exercise.rpe)")
                    .padding(.trailing, 20)
            }
            .font(.caption)
            
            Text("Rest \(exercise.restTimeInMinutes) minutes between sets")
                .font(.caption)
        }
        .padding()
    }
}

struct ExerciseCardView_Previews: PreviewProvider {
    static var exercise = Exercise.sampleData[0]
    static var previews: some View {
        ExerciseCardView(exercise: exercise)
            .previewLayout(.fixed(width: 400, height: 60))
        
        
        
    }
}
