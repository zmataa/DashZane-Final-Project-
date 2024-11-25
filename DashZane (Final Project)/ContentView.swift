import SwiftUI

struct ContentView: View {
    @State private var signupID = UUID() // Force refresh of signup view
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Log In", destination: SwiftUIViewLogin())
                    .padding()
                NavigationLink("Sign Up", destination: SwiftUIViewSignup().id(signupID))
                    .padding()
            }
            .navigationTitle("DashZane")
        }
    }
}

#Preview {
    ContentView()
}
