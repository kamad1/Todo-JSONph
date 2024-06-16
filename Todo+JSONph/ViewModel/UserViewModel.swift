
import Foundation
class UserViewModel: ObservableObject {

    @Published var user: [User] = []
    
    init() {
        
       
        getData()
    }
    
    
    func getData() {
        Task {
            do {
                let user = try await NetworkService.shared.getAllUser()
                DispatchQueue.main.async {
                    self.user = user
                    print(user.count)
                }
            } catch {
               print(error)
           }
        }
    }
}
