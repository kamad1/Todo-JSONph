
import SwiftUI

struct OrangeView: View {
    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
                List(viewModel.user) { user in
                    DetailUserView(viewModel: .init(user: user))
                }
        
//        List(viewModel.user, id: \.id) { user in
//            NavigationLink {
//                DetailUserView(viewModel: .init(user: user))
//                
//            } label: {
//                Text(user.description)
//                    .background(.clear)
//            }
//        }
    }
}
//#Preview {
//    OrangeView()
//}
