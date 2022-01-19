//
//  userDetails.swift
//  prasannaSwiftUI
//
//  Created by Prasannakumar Manikandan on 18/01/22.
//

import Foundation

class userDetails: ObservableObject {
    internal init(name: String = "", userID: String = "0", userPassword: String = "", numberSwift: String = "0") {
        self.name = name
        self.userID = userID
        self.userPassword = userPassword
        self.numberSwift = numberSwift
    }
    
    @Published var name: String
    @Published var userID: String
    @Published var userPassword: String
    @Published var numberSwift: String
}
