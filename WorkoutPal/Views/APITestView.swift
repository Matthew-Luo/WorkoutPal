//
//  APITestView.swift
//  WorkoutPal
//
//  Created by Matthew Luo on 8/29/23.
//

import SwiftUI
import Foundation

struct APITestView: View {
    @State private var activity: Activity?

    var body: some View {
        VStack(spacing: 20) {
            if let activity = activity {
                Text("Activity: \(activity.activity)")
                Text("Type: \(activity.type)")
                Text("Participants: \(activity.participants)")
            } else {
                Text("Loading...")
            }
            
            Button("Generate Suggestion") {
                let url = "https://www.boredapi.com/api/activity"
                getData(from: url)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }

    private func getData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data, error == nil else {
                print("Error with getting data")
                return
            }

            do {
                let result = try JSONDecoder().decode(Activity.self, from: data)
                DispatchQueue.main.async {
                    self.activity = result
                }
            } catch {
                print("Failed to parse data")
            }
        }

        task.resume()
    }
}

struct Activity: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
}

struct APITestView_Previews: PreviewProvider {
    static var previews: some View {
        APITestView()
    }
}
