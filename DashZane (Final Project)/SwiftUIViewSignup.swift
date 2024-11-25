//
//  SwiftUIViewSignup.swift
//  DashZane (Final Project)
//
//  Created by Zane Matarieh on 11/20/24.
//

import SwiftUI
import SwiftData

struct SwiftUIViewSignup: View {
    @Environment(\.modelContext) private var context // Access SwiftData from all files
    @State var masterSignupUsername = ""
    @State var masterSignupPassword = ""
    @State var signupMessage = ""

    var body: some View {
        VStack {
            Text("Create a new account")
                .font(.bold(.title)())
                .padding()

            Text("Username")
                .padding()

            TextField("Enter username", text: $masterSignupUsername)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30)
                .padding()

            Text("Password")
                .padding()

            SecureField("Enter password", text: $masterSignupPassword)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30)
                .padding()

            Button("Sign Up") {
                signUp()
            }
            .padding()

            if !signupMessage.isEmpty {
                Text(signupMessage)
                    .foregroundColor(signupMessage == "Signup successful!" ? .green : .red)
                    .padding()
            }
        }
    }

    // Function to handle signup
    func signUp() {
                    
            }
        }
#Preview {
    SwiftUIViewSignup()
}
