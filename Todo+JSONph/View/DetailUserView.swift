
import SwiftUI

struct DetailUserView: View {
    @StateObject var viewModel: DetailUserViewModel
    
    var body: some View {
        VStack {
            Text("\(viewModel.user.name)")
            Text("\(viewModel.user.username)")
            Text("\(viewModel.user.email)")
            Text("\(viewModel.user.address.city),\(viewModel.user.address.street), \(viewModel.user.address.suite), \(viewModel.user.address.zipcode)")
            Text("\(viewModel.user.phone)")
            Text("\(viewModel.user.website)")
            Text("\(viewModel.user.company.bs), \(viewModel.user.company.catchPhrase), \(viewModel.user.company.name)")    
            Text("\(viewModel.user.id)").font(.largeTitle).foregroundStyle(.red)
                    
          
          
               
        }
       
    }
}
//let id: Int
//let name, username, email: String
//let address: Address
//let phone, website: String
//let company: Company
//}
