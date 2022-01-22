//
//  loginView.swift
//  prasannaSwiftUI
//
//  Created by Prasannakumar Manikandan on 19/12/21.
//

import SwiftUI


struct signUpPage: View {
    
    @Binding var FirstName: String
    @State var firstName = ""
    @State var userID = ""
    @State var numberSwift = ""
    @State var Password = ""
    @State var ConfirmPassword = ""
    @State var numberSwifts = 0
    @State var suggessionSwift = 0.0
    @State var suggessionSwiftString = "0"
    @ObservedObject var user: userDetails
    @State private var isNaviteToLogIn = false
    @State var isShowsAlert = false
    @State var isPermissionOk = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea([.all])
            ScrollView(showsIndicators: false) {
                VStack {
                    Group {
                        Text("Enter Your Details:")
                            .padding()
                            .foregroundColor(.white)
                        Text("First Name:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("First Name", text: $user.name)
                        Group {
                            Text("User ID")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("User ID", text: $user.userID)
                        }
                        Text("Password:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        SecureField("Password", text: $user.userPassword)
                        Text("Confirm Password:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        SecureField("Confirm Password", text: $user.userPassword)
                        
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Group {
                        Text("Number Swift:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            TextField("numberSwift", text: $user.numberSwift)
                                .layoutPriority(1)
                                .keyboardType(.decimalPad)
                            Stepper("", value: $numberSwifts) {_ in
                                user.numberSwift = String(numberSwifts)
                            }
                            .frame(height: 40)
                            .background(Color.yellow)
                            .cornerRadius(6)
                            .accentColor(.yellow)
                        }
                        Text("Suggession Swift")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("numberSwift", text: $suggessionSwiftString)
                            .keyboardType(.decimalPad)
                        Slider(value: $suggessionSwift, in: 0...10, step: 1) {_ in
                            suggessionSwiftString = String(suggessionSwift)
                        }
                        .accentColor(.yellow)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .border(Color.yellow, width: 2)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Toggle(isOn: $isPermissionOk) {
                            Text("Save Details")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Button(action: {
                            self.isShowsAlert = true
                            print("Button action")
                        }) {
                            Text("Save")
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .foregroundColor(.black)
                                .background(Color.blue)
                        }.cornerRadius(5)
                            .padding(.top, 30)
                            .disabled(!isPermissionOk)
                            .opacity(isPermissionOk ? 1 : 0.5)
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Spacer()
                }.textFieldStyle(OvalTextFieldStyle())
            }
            .blur(radius: isShowsAlert ? 1 : 0)
            .disabled(isShowsAlert)
            
            if isShowsAlert {
                MyAlert(isShowsAlert: $isShowsAlert)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {dismiss()}) {
            Text("Cancel")
                .foregroundColor(Color.yellow)
        }, trailing:
                                Button(action: {dismiss()}) {
            Text("Save")
                .foregroundColor(Color.yellow)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        })
    }
}


