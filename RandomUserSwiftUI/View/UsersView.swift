import SwiftUI

struct UsersView: View {
    @StateObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            List(userData.users) { user in
                HStack {
                    AsyncImage(url: URL(string: user.picture.thumbnail)) { phase in
                        switch phase {
                        case .success(let image):
                            image.clipShape(Circle())
                        case .failure(let error):
                            Image(systemName: "person")
                            let _ = print("error: \(error.localizedDescription)")
                        case .empty:
                            ProgressView()
                        }
                    }
                    Text(user.fullName)
                }
            }
            .navigationTitle("Random Users")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
