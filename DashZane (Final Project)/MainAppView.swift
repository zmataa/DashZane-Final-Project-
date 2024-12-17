import SwiftUI

struct MainAppView: View {
    //@Binding makes a variable passed down from the contentview able to be changed and used between views
    @Binding var user: UserData? // The currently logged-in user
    @Binding var users: [UserData] //the list of signed up users and their data
    @Binding var isLoggedIn: Bool //tracks if logged in
    @State private var newWebsite = ""
    @State private var newUsername = ""
    @State private var newPassword = ""

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.green.opacity(0.2).edgesIgnoringSafeArea(.all) //bg color
            VStack(alignment: .leading) {
                if user != nil { // Check if user exists
                    // Welcome Message
                    Text("Welcome, \(user!.username)!")
                        .font(.largeTitle)
                        .padding()

                    // Logout Button
                    Button(action: logout) {
                        Text("Log Out")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(8)
                            .frame(width: 100)
                            .background(Color.gray)
                            .cornerRadius(8)
                    }
                    .padding([.bottom, .trailing], 20)

                    // Add New Credential Section
                    VStack(alignment: .leading) {
                        Text("Add New Credential")
                            .font(.headline)
                            .padding(.bottom, 10)

                        TextField("Website", text: $newWebsite)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 5)

                        TextField("Username", text: $newUsername)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 5)

                        SecureField("Password", text: $newPassword)
                            .textFieldStyle(.roundedBorder)
                            .padding(.bottom, 10)

                        Button("Save Credential") {
                            saveCredential()
                        }
                        .padding()
                    }

                    Divider() //makes a little line to separate sections of the app

                    // Saved Credentials Section
                    VStack(alignment: .leading) {
                        Text("Saved Credentials")
                            .font(.headline)
                            .padding(.bottom, 10)

                        if user!.dataList.isEmpty { //if user exists and dataList is empty
                            Text("No credentials saved yet.")
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                        } else { //anything else (if user exists and there IS data)
                            ScrollView { //scroll through the saved creds
                                ForEach(user!.dataList, id: \.id) { item in //for loop to loop through all items in datalist and display, each time a new dataItem is pulled it assigns it to item to be used by the text views
                                    VStack(alignment: .leading) {
                                        Text("Website: \(item.website)")
                                            .font(.subheadline)
                                            .fontWeight(.bold)

                                        Text("Username: \(item.username)")
                                            .font(.subheadline)

                                        Text("Password: \(item.password)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                    Divider()
                                }
                            }
                        }
                    }
                    .padding()
                } else {
                    Text("Error: No user found.") //if user isnt logged in but somehow on mainapp page, display error
                        .foregroundColor(.red)
                        .font(.headline)
                        .padding()
                }
            }
            .padding()
        }
    }

    private func saveCredential() {
        // Use direct access to the binding to update the user's dataList
        if var currentUser = user { //mutatable user
            let newItem = DataItem(username: newUsername, password: newPassword, website: newWebsite) //makes a new item to add to currentusers lsit
            currentUser.dataList.append(newItem) // appends the new credential
            user = currentUser // set original user to mutatable user
            print(self.user) //debug
            newWebsite = "" //reset website and username so user can add anotehr
            newUsername = ""
            newPassword = ""
        }
    }

    private func logout() { // logout function
        var index = users.firstIndex(where: { $0.username == user?.username }) //finds the user in users by going throgh each user in users, then uses the $0.username to pull the user's username and compares it to the username of the user logged in
        users[index!] = user! //updates user in list of users so when we logout and back in the user's data is updated
           user = nil // Clear the logged-in user
           isLoggedIn = false //sets it to nobody logged in, this makes it return to the home page
       }
   }
