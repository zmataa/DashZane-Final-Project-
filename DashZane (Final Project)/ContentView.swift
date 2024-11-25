//
//  ContentView.swift
//  DashZane (Final Project)
//
//  Created by Zane Matarieh on 11/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var signupID = UUID() // Unique ID to force signup view refresh
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink("Log In", destination: SwiftUIViewLogin())
                    .padding()
                NavigationLink("Sign Up", destination: SwiftUIViewSignup().id(signupID))
                                   .padding()
            }
                       .navigationTitle("DashZane")
                       .multilineTextAlignment(.center)
                   }
                   .onAppear {
                       resetSignupView()
                   }
               }

               /// Resets the signup view when navigating back
               func resetSignupView() {
                   signupID = UUID()
               }
           }

           #Preview {
               ContentView()
                   .modelContainer(for: [User.self]) // Ensure data is shared across views
           }
