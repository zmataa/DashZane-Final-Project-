import SwiftUI

struct SwiftUIViewSignup: View {
    @Binding var user: UserData?
    @Binding var users: [UserData] // List of all registered users
    @Binding var isLoggedIn: Bool
    
    @State private var username = ""
    @State private var password = ""
    @State private var message = ""
    
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
                    .disableAutocorrection(true)
                
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
    
    private func signUpUser() {
        print("Users before signup: \(users)")
        
        if username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            message = "Both fields are required."
            return
        }
        
        for user in users {
            if user.username.lowercased() == username.lowercased() {
                message = "Username already exists."
                return
            }
        }
        let newUser = UserData(username: username, password: password)
        users.append(newUser)
        print("Users after signup: \(users)")
        user = newUser
        message = "Signup successful!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isLoggedIn = true
        }
    }
}
