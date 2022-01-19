//
//  userLoginView.swift
//  prasannaSwiftUI
//
//  Created by Prasannakumar Manikandan on 19/01/22.
//

import SwiftUI

struct userLoginView: View {
    
    @ObservedObject var user: userDetails
    @State var sectionIndex = 0
    @State var array = ["Name", "User ID", "Password", "NumberSwift"]
    
    var body: some View {
        VStack {
            Picker("", selection: $sectionIndex) {
                ForEach((0..<4)) { value in
                    Text("\(array[value])").tag(value)
                }
            }.pickerStyle(SegmentedPickerStyle())
            Text("Selected is \(sectionIndex == 0 ? "Name - \(user.name)" : sectionIndex == 1 ? "User ID - \(user.userID)" : sectionIndex == 2 ? "Password - \(user.userPassword )" : sectionIndex == 3 ? "NumberSwift - \(user.numberSwift)" : "")")
            Form {
                Section(header: Text("User Details")) {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(user.name)
                    }
                    HStack {
                        Text("User ID")
                        Spacer()
                        Text(user.userID)
                    }
                    HStack {
                        Text("Password")
                        Spacer()
                        Text(user.userPassword)
                    }
                    HStack {
                        Text("Number Swift")
                        Spacer()
                        Text(user.numberSwift)
                    }
                }
            }
        }
    }
}
