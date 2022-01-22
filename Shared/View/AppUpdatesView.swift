//
//  userLoginView.swift
//  prasannaSwiftUI
//
//  Created by Prasannakumar Manikandan on 19/01/22.
//

import SwiftUI

struct userLoginView: View {
    
    @StateObject var user = userLoginViewModel()
    @State var isNewAppOk = false
    @State var sectionIndex = 0
    @State var isPickerDisplay = false
    @State var pickerOptions = ["None", "EDUCATION", "SOCIAL NETWORKING", "TRAVEL", "NEWS", "MARKETING"]
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header:
                                Text("Available")
                                .foregroundColor(Color.black)
                                .font(Font.system(size: 28))
                                .fontWeight(.semibold)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))) {
                        ForEach(user.userApps, id: \.id) { app in
                            HStack {
                                Image("iconApp")
                                    .resizable()
                                    .background(Color.paleGrey)
                                    .frame(width: 65, height: 65)
                                    .cornerRadius(20)
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(app.appName)
                                        .font(Font.system(size: 18))
                                        .fontWeight(.medium)
                                    Text("Version \(app.appVersion)")
                                        .font(Font.system(size: 10))
                                        .fontWeight(.light)
                                    Text(app.appCategory)
                                        .foregroundColor(.darkishPink60)
                                        .font(Font.system(size: 10))
                                        .fontWeight(.light)
                                }.padding(EdgeInsets(top: 14, leading: 0, bottom: 14, trailing: 0))
                                Spacer()
                                Button(action: {
                                    print(app.appName)
                                    user.userUpdated.append(app)
                                    user.filteredApp.append(app)
                                    for recentlyUpdated in 0..<user.userApps.count {
                                        print(recentlyUpdated)
                                        if user.userApps[recentlyUpdated].appName == app.appName {
                                            user.userApps.remove(at: recentlyUpdated)
                                            break
                                        }
                                    }
                                }) {
                                    Text("Update")
                                        .padding()
                                        .font(Font.system(size: 13))
                                        .foregroundColor(.darkishPink)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                .frame(width: 80, height: 35)
                                .background(Color.darkishPink10)
                                .cornerRadius(20)
                            }
                        }
                        
                    }.headerProminence(.increased)
                    Section(header:
                                Text("Updated Recently")
                                .foregroundColor(Color.black)
                                .font(Font.system(size: 28))
                                .fontWeight(.semibold)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))) {
                        ForEach(user.userUpdated) { updatedApp in
                            HStack {
                                Image("iconApp")
                                    .resizable()
                                    .background(Color.paleGrey)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(20)
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("\(updatedApp.appName)")
                                        .font(Font.system(size: 20))
                                        .fontWeight(.medium)
                                    Text("Version \(updatedApp.appVersion)")
                                        .font(Font.system(size: 11))
                                        .fontWeight(.light)
                                    Text("\(updatedApp.appCategory)")
                                        .foregroundColor(.darkishPink60)
                                        .font(Font.system(size: 11))
                                        .fontWeight(.light)
                                }.padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                            }.padding(EdgeInsets(top: 14, leading: 0, bottom: 14, trailing: 0))
                        }
                    }.headerProminence(.increased)
                }
                .refreshable {
                    print("Do your refresh work here")
                    isPickerDisplay = false
                }
                .listStyle(.plain)
                .onAppear() {
                    UITableView.appearance().backgroundColor = UIColor.white
                    UITableViewCell.appearance().backgroundColor = UIColor.white
                }
                
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle(Text("Updates")
                                        .font(Font.system(size: 23))
                                        .fontWeight(.medium),displayMode: .inline)
                .navigationBarItems(trailing:
                                        HStack {
                    Button(action: {
                        isPickerDisplay = true
                    }) {
                        Image("iconFilter")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    Spacer()
                        .frame(width: 10)
                    NavigationLink(destination: newAppView(user: user), isActive: $isNewAppOk) {
                        Button(action: {isNewAppOk = true}) {
                            Image("iconAdd")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                })
                if isPickerDisplay {
                    VStack {
                        Button(action: {isPickerDisplay = false}) {
                            Text("Done")
                                .foregroundColor(Color.black)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            .background(Color.steel12)
                        Picker("", selection: $sectionIndex) {
                            ForEach((0..<pickerOptions.count)) { value in
                                Text("\(pickerOptions[value])")
                            }.onChange(of: sectionIndex, perform: { newValue in
                                user.userUpdated = user.filterApps(userUpdatedApp: user.filteredApp, category: pickerOptions[sectionIndex])
                            })
                        }.background(Color.steel12)
                            .pickerStyle(WheelPickerStyle())
                    }
                }
            }
        }
    }
}


