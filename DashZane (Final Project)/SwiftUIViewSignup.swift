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
            // Check if either field is empty
            guard !masterSignupUsername.isEmpty, !masterSignupPassword.isEmpty else {
                signupMessage = "Please fill out both fields."
                return
            }

            // Create a fetch request to check if the username already exists in the database
        var fetchRequest = FetchDescriptor<User>()
           fetchRequest.predicate = #Predicate { $0.username == masterSignupUsername }


            // Check if username is taken
            if let existingUser = try? context.fetch(fetchRequest).first {
                signupMessage = "Username is already taken."
                return
            }

            // If username is available, create a new User
            let newUser = User(username: masterSignupUsername, password: masterSignupPassword)

            // Insert the new user into the context
            context.insert(newUser)

            do {
                // Save the context to persist the new user
                try context.save()
                signupMessage = "Signup successful!"
            } catch {
                // Handle error if saving fails
                signupMessage = "Error saving account. Please try again."
                print("Error saving user: \(error)") // Log the error for debugging purposes
            }
        }
    }
#Preview {
    SwiftUIViewSignup()
}
