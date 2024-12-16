import SwiftUI

struct MainAppView: View {
    @Binding var user: UserData? // The currently logged-in user
    @Binding var users: [UserData]
    @Binding var isLoggedIn: Bool
    @State private var newWebsite = ""
    @State private var newUsername = ""
    @State private var newPassword = ""

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.green.opacity(0.2).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                if user != nil { // Check if user exists, but don’t use `if let`
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

                    Divider()

                    // Saved Credentials Section
                    VStack(alignment: .leading) {
                        Text("Saved Credentials")
                            .font(.headline)
                            .padding(.bottom, 10)

                        if user!.dataList.isEmpty {
                            Text("No credentials saved yet.")
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                        } else {
                            ScrollView {
                                ForEach(user!.dataList, id: \.id) { item in
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
                    Text("Error: No user found.")
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
        if var currentUser = user {
            let newItem = DataItem(username: newUsername, password: newPassword, website: newWebsite)
            currentUser.dataList.append(newItem) // Append the new credential
            user = currentUser // Reassign the updated user back to the binding
            print(self.user)
            // Clear input fields
            newWebsite = ""
            newUsername = ""
            newPassword = ""
        }
    }

    private func logout() {
        var index = users.firstIndex(where: { $0.username == user?.username })
        users[index!] = user!
           user = nil // Clear the logged-in user
           isLoggedIn = false
       }
   }
