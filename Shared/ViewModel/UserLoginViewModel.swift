//
//  userAppView.swift
//  prasannaSwiftUI
//
//  Created by Prasannakumar Manikandan on 20/01/22.
//

import SwiftUI

class userLoginViewModel: ObservableObject {
    @Published var userApps: [userApp] = [userApp(appName: "Face Book", appVersion: "1.2", appCategory: "SOCIAL NETWORKING")]
    @Published var userUpdated: [userApp] = []
    @Published var filteredApp: [userApp] = []
    
    func filterApps(userUpdatedApp: [userApp], category: String ) -> [userApp] {
        var changedUserApp: [userApp] = []
        print(category)
        if category == "None" {
            changedUserApp = filteredApp
        } else {
            for apps in filteredApp {
                print(apps.appCategory)
                print(category)
                if apps.appCategory == category {
                    changedUserApp.append(apps)
                }
            }
        }
        print(changedUserApp)
        return changedUserApp
    }
}

struct userApp: Identifiable {
    var id = UUID().uuidString
    var appName: String
    var appVersion: String
    var appCategory: String
}

func checkName(name: String) -> Bool {
    let pattern = "^[a-zA-Z ]*$"
    let stringCheck = name.range(of: pattern, options: .regularExpression)
    if stringCheck != nil && name != "" {
        return true
    } else {
        return false
    }
}

func checkVersion(version: String) -> Bool {
    let pattern = "^[0-9.]*$"
    let versionCheck = version.range(of: pattern, options: .regularExpression)
    if versionCheck != nil && version != "" {
        return true
    } else {
        return false
    }
}
