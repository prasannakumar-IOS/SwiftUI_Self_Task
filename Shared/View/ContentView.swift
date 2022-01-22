//
//  ContentView.swift
//  Shared
//
//  Created by Prasannakumar Manikandan on 04/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstName = ""
    @State private var password = ""
    @State private var isNaviteOk = false
    @State private var isLogInOk = false
    @State var isDisabledButton = false
    @State var popoverSize = CGSize(width: 300, height: 300)
    @StateObject var user = userDetails(name: "", userID: "", userPassword: "", numberSwift: "0")
    @Environment(\.isEnabled) var isEnabled
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("cityOk")
                    .resizable()
                    .ignoresSafeArea()
                    .blur(radius: 10)
                ScrollView(showsIndicators: false) {
                    VStack {
                        Text("Learning Task 1")
                            .font(.headline).bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 200)
                        Group {
                            Text("Welcome")
                                .font(.system(size: 40)).bold()
                                .padding()
                                .foregroundColor(.white)
                            Image("apple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .cornerRadius(60)
                            TextField("First Name", text: $firstName)
                                .padding()
                                .frame(height: 50)
                                .background()
                                .cornerRadius(5)
                            SecureField("Password", text: $password)
                                .padding()
                                .frame(height: 50)
                                .background()
                                .cornerRadius(5)
                            NavigationLink(destination: userDetailsView(user: user), isActive: $isLogInOk) {
                                Button(action: {
                                    self.isLogInOk = true
                                }) {
                                    Text("LogIn")
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .foregroundColor(.black)
                                        .background(Color.red)
                                }.cornerRadius(5)
                            }
                            //                        .alert("Test", isPresented: $isShowsAlert, actions: {
                            //                            Button("Sample", action: {})
                            //                            Button("True", role: .none , action: {self.isDisabledButton = true})
                            //                            Button("False", role: .destructive, action: {self.isDisabledButton = false})
                            //                            Button("Test", role: .cancel, action: {}).disabled(isDisabledButton)
                            //                        }, message: {
                            //                            Text("LogIN is happy")
                            //                        })
                            //                        .alert(isPresented: $isShowsAlert) { () -> Alert in
                            //                            let secondaryButton = Alert.Button.cancel(Text("Secondary")) {
                            //                                            print("secondary button pressed")
                            //                            }
                            //                            return Alert(title: Text("LogIn"), message: Text("LogIn the user"), primaryButton: .default(Text("LogIn"), action: {
                            //                                            print("Okay Click")
                            //                            }), secondaryButton: secondaryButton)
                            //                        }
                            NavigationLink(destination: signUpPage(FirstName: $firstName, user: user), isActive: $isNaviteOk) {
                                Button(action: {
                                    print("Button action")
                                    self.isNaviteOk = true
                                    user.name = ""
                                    user.userID = ""
                                    user.userPassword = ""
                                    user.numberSwift = "0"
                                    
                                }) {
                                    Text("Sign Up ?")
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 30)
                                        .foregroundColor(.black)
                                        .background(Color.blue)
                                }
                                .cornerRadius(5)
                            }
                        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        Spacer()
                            .navigationBarHidden(true)
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

