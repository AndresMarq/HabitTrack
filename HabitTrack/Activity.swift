//
//  Activity.swift
//  HabitTrack
//
//  Created by Andres on 2021-07-09.
//

import Foundation

struct Activity: Identifiable, Codable{
    var title: String = ""
    var description: String = ""
    var timeGoal: Double = 0.0
    var id = UUID()
}

class Activities: ObservableObject {
    @Published var totalActivities = [Activity]() {
        didSet {
            let enconder = JSONEncoder()
            if let encoded = try? enconder.encode(totalActivities) {
                UserDefaults.standard.setValue(encoded, forKey: "Activity")
            }
        }
    }
    
    init() {
        if let activity = UserDefaults.standard.data(forKey: "Activity") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Activity].self, from: activity) {
                self.totalActivities = decoded
                return
            }
        }
        
        self.totalActivities = []
    }
}
