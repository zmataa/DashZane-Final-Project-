import SwiftUI

struct SwiftUIViewLogin: View {
    @Binding var user: UserData?
    @Binding var users: [UserData] // List of all users
    @Binding var isLoggedIn: Bool // Tracks whether the user is logged in
    
    @State private var username = ""
    @State private var password = ""
    @State private var message = ""
    
    var body: some View {
        ZStack{
            Color.green.opacity(0.2).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Log In")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Enter username (case sensitive)", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Enter password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Log In") {
                    logInUser()
                }
                .padding()
                
                Text(message)
                    .foregroundColor(message == "Login successful!" ? .green : .red)
                    .padding()
            }
            .padding()
        }
    }
    
    private func logInUser() {
        print("Users array: \(users)") // Add this debug print to check the users array.
        print("Entered username: \(username), Entered password: \(password)") // Add debug prints for username and password.
        
        
        for auser in users{
            if(auser.username == username && auser.password == password){
                user = auser
                message = "Login successful!"
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    isLoggedIn = true
                }
            }
            else
            {
                print("No matching user found.")
                message = "Invalid username or password."
            }
            
        }
        
    }
}
