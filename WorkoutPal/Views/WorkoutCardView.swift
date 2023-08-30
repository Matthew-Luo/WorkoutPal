//
//  WorkoutCardView.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/25/23.
//

import SwiftUI

struct WorkoutCardView: View {
    let workout: Workout
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(workout.name)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(workout.exercies.count)", systemImage: "dumbbell")
                Spacer()
                Label("\(workout.estimatedDuration)", systemImage: "clock")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
        .padding()
    }
}

struct WorkoutCardView_Previews: PreviewProvider {
    static var workout = Workout.sampleData[0]
    static var previews: some View {
        WorkoutCardView(workout: workout)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
