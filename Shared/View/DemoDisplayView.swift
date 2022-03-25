//
//  DemoDisplayView.swift
//  prasannaSwiftUI
//
//  Created by Prasannakumar Manikandan on 04/02/22.
//

import SwiftUI

struct DemoDisplayView: View {
    
    var name: String
    
    var body: some View {
        Text(name)
    }
}

struct DemoDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DemoDisplayView(name: "")
    }
}
