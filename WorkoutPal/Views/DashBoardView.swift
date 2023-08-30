//
//  ContentView.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/25/23.
//

import SwiftUI

struct DashBoardView: View {
    @Binding var workouts: [Workout]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewWorkoutView = false
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            List($workouts) { $workout in
                NavigationLink(destination: WorkoutDetailsView(workout: $workout)) {
                    WorkoutCardView(workout: workout)
                }
            }
            .navigationTitle("My Workouts")
            .toolbar {
                Button(action: {
                    isPresentingNewWorkoutView = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresentingNewWorkoutView) {
            NewWorkoutSheet(workouts: $workouts, isPresentingNewWorkoutView: $isPresentingNewWorkoutView)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView(workouts: .constant(Workout.sampleData), saveAction: {})
    }
}
