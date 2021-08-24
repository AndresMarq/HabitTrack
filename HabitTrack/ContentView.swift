//
//  ContentView.swift
//  HabitTrack
//
//  Created by Andres on 2021-07-09.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userActivity = Activities()
    @State private var showNewActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userActivity.totalActivities) {activity in
                    NavigationLink(destination: ActivityView(activity: activity)) {
                        HStack {
                            Text(activity.title)
                                .bold()
                            Spacer()
                            Text("Your goal: \(activity.timeGoal, specifier: "%g")")
                        }
                    }
                }
                Text("Your activities")
               
            }.navigationBarTitle("HabitTrack")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showNewActivity = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showNewActivity) {
                NewActivity(userActivity: userActivity)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
