//
//  ActivityView.swift
//  HabitTrack
//
//  Created by Andres on 2021-07-09.
//

import SwiftUI

struct ActivityView: View {
    var activity: Activity
    //Stores time spent in activity
    @State private var timeDone = 0.0
    //Stores time to add to timeDone prior to submitting
    @State private var prelimTimeDone = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                Text(activity.description)
                    .frame(width: 350, height: 75)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                
                Text("You have done \(timeDone, specifier: "%g") out of \(activity.timeGoal, specifier: "%g") hours")
                    .frame(width: 350, height: 50, alignment: .center)
                    .font(.title2)
                
                let completion: Double = (timeDone/activity.timeGoal) * 100
                Text("Completion: \(completion, specifier: "%g")%")
                    .frame(width: 200, height: 50, alignment: .center)
                    .font(.title2)
                
                Stepper("Hours done today: \(prelimTimeDone, specifier: "%g")", value: $prelimTimeDone, in: 0...activity.timeGoal)
                
                Button("Submit") {
                    timeDone += prelimTimeDone
                }
                
            } .navigationBarTitle(activity.title)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static let exampleActivity = Activity(title: "Sample", description: "This is a sample description of a common activity", timeGoal: 40)
    
    static var previews: some View {
        ActivityView(activity: exampleActivity)
    }
}
