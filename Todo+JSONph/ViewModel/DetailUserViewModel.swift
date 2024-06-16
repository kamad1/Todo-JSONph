
import Foundation
class DetailUserViewModel: ObservableObject {
    @Published var user: User
    init(user: User) {
        self.user = user

        getData()
    }
    
    
    func getData() {
        
    }
}
