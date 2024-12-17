import SwiftUI

struct SwiftUIViewLogin: View {
    @Binding var user: UserData?
    @Binding var users: [UserData] // List of all users
    @Binding var isLoggedIn: Bool // Tracks whether the user is logged in
    
    @State private var username = ""
    @State private var password = ""
    @State private var message = "" // used to display the login message (succesful or not)
    
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
        //loop through the users array, for each user check if its username and password match up to the one typed into the textbox
        for auser in users{
            if(auser.username == username && auser.password == password){
                user = auser
                message = "Login successful!" //if it does work, login is succesful
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { //dispatchque.main refers to the main thread where all ui updates go through, asyncafter sets an asynchronous action to happen after deadline: .now current time + 1 second, then sets loggedin to true and takes you to mainapp page
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
