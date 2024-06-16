

import SwiftUI

struct ContentView: View {
    @State var selected = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selected) {
                TodosView()
                OrangeView()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
        }
    }
}

#Preview {
    ContentView()
}
