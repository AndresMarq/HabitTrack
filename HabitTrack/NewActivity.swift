//
//  NewActivity.swift
//  HabitTrack
//
//  Created by Andres on 2021-07-09.
//

import SwiftUI

struct NewActivity: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var userActivity: Activities
    
    @State private var inputTitle: String = ""
    @State private var inputDescription: String = ""
    @State private var inputTimeGoal: String = ""
    
    var body: some View {
        NavigationView{
            List {
                TextField("Activity name", text: $inputTitle)
                TextField("Activity description", text: $inputDescription)
                TextField("Time goal in hours", text: $inputTimeGoal)
                
                Button("Submit") {
                    let input = Activity(title: self.inputTitle, description: self.inputDescription, timeGoal: Double(self.inputTimeGoal) ?? 0)
                    
                    self.userActivity.totalActivities.append(input)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("Add New Activity")
        }
    }
}

struct NewActivity_Previews: PreviewProvider {
    static var previews: some View {
        NewActivity(userActivity: Activities())
    }
}
