//
//  SwiftUIViewLogin.swift
//  DashZane (Final Project)
//
//  Created by Zane Matarieh on 11/20/24.
//

import SwiftUI

struct SwiftUIViewLogin: View {
    var body: some View {
        VStack {
            @State var masterUsername = ""
            @State var masterPassword = ""
            Text("Log in to existing account")
                .font(.bold(.title)())
                .padding()
            Text("Username")
                .padding()
            TextField("Enter username" , text:$masterUsername)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30)
                .padding()
            Text("Password")
                .padding()
            TextField("Enter username" , text: $masterPassword)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30)
                .padding()
            
            Button("Log in") {
                
            }
            .padding()
        }
    }
}

#Preview {
    SwiftUIViewLogin()
}
