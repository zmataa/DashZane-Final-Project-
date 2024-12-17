import SwiftUI

struct SwiftUIViewSignup: View {
    @Binding var user: UserData?
    @Binding var users: [UserData] // List of all registered users
    @Binding var isLoggedIn: Bool
    
    @State private var username = ""
    @State private var password = ""
    @State private var message = "" //same as login message
    
    var body: some View {
        ZStack{
            Color.green.opacity(0.2).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Create a username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true) //disables autocorrection and auto caps so that a user can type in exactly what tehy want to
                
                SecureField("Create a password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Sign Up") {
                    signUpUser()
                }
                .padding()
                
                Text(message)
                    .foregroundColor(message == "Signup successful!" ? .green : .red)
                    .padding()
            }
            .padding()
        }
    }
    
    private func signUpUser() { //if username or password is empty tell user to fix
        if username.isEmpty || password.isEmpty {
            message = "Both fields are required."
            return
        }
        
        for user in users { //loop through users, check each user to see if each username matches with the inputted username and if it does, it tells the user that username is taken
            if user.username.lowercased() == username.lowercased() {
                message = "Username already exists."
                return
            }
        }
        let newUser = UserData(username: username, password: password) //makes  a new user with inputted info
        users.append(newUser) //append new user to users
        user = newUser //set current user to the user just created
        message = "Signup successful!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { //wait a second then set loggged in to true and take user to main page
            isLoggedIn = true
        }
    }
}
