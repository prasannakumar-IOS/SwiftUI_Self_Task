//
//  customViews.swift
//  prasannaSwiftUI
//
//  Created by Prasannakumar Manikandan on 23/12/21.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.yellow)
            .cornerRadius(5)
    }
}

struct MyAlert: View {
    
    @State private var texts = ""
    @Binding var isShowsAlert: Bool
    @State var textChanges: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
        VStack {
            Text("Enter Input").font(.headline).padding()
            TextField("Name", text: $texts)
                .onChange(of: texts, perform: { newValue in
                    if texts.count > 0 {
                        textChanges = true
                    } else {
                        textChanges = false
                    }
                })
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                .font(.system(size: 16))
                .background(Color.white)
                .cornerRadius(30)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            Divider()
            HStack {
                Spacer()
                Button(action: {
                    isShowsAlert = false
                    dismiss()
                }) {
                    Text("Done")
                }.disabled(!textChanges)
                Spacer()
                Divider()
                Spacer()
                Button(action: {
                    isShowsAlert = false
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
                Spacer()
            }.padding(0)
        }.background(Color(white: 0.9))
            .frame(width: 230, height: 130)
            .cornerRadius(20)
        
    }
}
