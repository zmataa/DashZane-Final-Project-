import SwiftUI

struct ContentView: View {
    @State private var users: [UserData] = [UserData]() // create a list of all users as a userdata datatype
    @State private var user: UserData? = nil // The currently logged in user
    @State private var isLoggedIn = false // Tracks if there is a user logged in

    var body: some View {
        NavigationView {
            ZStack {
                Color.green.opacity(0.2).edgesIgnoringSafeArea(.all) //background color
                VStack {
                    Image("logo") //app icon in app
                        .resizable()
                           .scaledToFit()
                           .scaleEffect(0.8)
                    if isLoggedIn {
                        // lets user be used inside the block and calls mainappview with the signed in user
                        MainAppView(user: $user, users: $users, isLoggedIn:  $isLoggedIn)
                    } else {
                        // sign up and log in links
                        VStack(spacing: 20) {
                            NavigationLink(
                                "Sign Up",
                                destination: SwiftUIViewSignup(user: $user, users: $users, isLoggedIn: $isLoggedIn)
                            )
                            .font(.title2)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)

                            NavigationLink(
                                "Log In",
                                destination: SwiftUIViewLogin(user: $user, users: $users, isLoggedIn: $isLoggedIn)
                            )
                            .font(.title2)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        }
                        .padding()
                    }
                }
                .onAppear {
                    print("Users: \(users)") //debug
                }
            }
        }
    }
}

