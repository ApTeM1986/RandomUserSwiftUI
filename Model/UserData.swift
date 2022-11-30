import Foundation

@MainActor
class UserData: ObservableObject {
    
    @Published var users: [User] = []
    
    init() {
        Task {
            await loadUsers()
        }
    }
    private func loadUsers() async {
        do {
            let users = try await UserFetchingClient.getUsers()
            self.users = users
        }
        catch {
            print(error)
        }
    }
}



