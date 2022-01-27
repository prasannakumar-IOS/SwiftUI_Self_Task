//
//  newAppView.swift
//  prasannaSwiftUI
//
//  Created by Prasannakumar Manikandan on 20/01/22.
//

import SwiftUI

struct newAppView: View {
    
    @State var name = ""
    @State var version = ""
    @ObservedObject var user = userLoginViewModel()
    @State var sectionIndex = 0
    @State var pickerOptions = ["EDUCATION", "SOCIAL NETWORKING", "TRAVEL", "NEWS", "MARKETING"]
    @State var isPickerDisplay = false
    @State var Category = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
        VStack {
            Spacer().frame(height: 31)
            Text("Name")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black45)
                .font(Font.system(size: 16))
                .padding(.leading, 31)
            TextField("",text: $name)
                .padding()
                .frame(height: 40)
                .foregroundColor(.black)
                .background(Color.steel12)
                .padding(EdgeInsets(top: 0, leading: 31, bottom: 36, trailing: 31))
            Text("Version")
                .foregroundColor(.black45)
                .font(Font.system(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 31)
            TextField("",text: $version)
                .padding()
                .frame(height: 40)
                .foregroundColor(.black)
                .background(Color.steel12)
                .padding(EdgeInsets(top: 0, leading: 31, bottom: 36, trailing: 31))
            Text("Category")
                .foregroundColor(.black45)
                .font(Font.system(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 31)
            ZStack {
                TextField("",text: $pickerOptions[sectionIndex])
                    .padding()
                    .frame(height: 40)
                    .foregroundColor(Color.black)
                    .background(Color.steel12)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 0, trailing: 31))
                Button(action: {
                    isPickerDisplay = true
                    
                }) {
                    Image("dropdown")
                        .resizable()
                        .frame(width: 40,height: 40, alignment: .trailing)
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }.padding(.trailing, 31)
            
            Spacer()
            if isPickerDisplay {
                Picker("", selection: $sectionIndex) {
                    ForEach((0..<pickerOptions.count)) { value in
                        Text("\(pickerOptions[value])")
                    }
                }.pickerStyle(WheelPickerStyle())
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text("New app")
                                .font(Font.system(size: 23))
                                .fontWeight(.medium), displayMode: .automatic)
        .navigationBarItems(leading:
                                Button(action: {dismiss()}) {
            Text("Cancel")
                .font(Font.system(size: 16))
                .foregroundColor(Color.darkishPink)
        }, trailing:
                                Button(action: {
            if checkName(name: name) == true && checkVersion(version: version) == true && checkName(name: pickerOptions[sectionIndex]) == true {
                user.userApps.append(userApp(appName: name, appVersion: version, appCategory: pickerOptions[sectionIndex]))
                dismiss()
            }
        }) {
            Text("Save")
                .font(Font.system(size: 16))
                .foregroundColor(Color.darkishPink)
        })
    }
}
}
