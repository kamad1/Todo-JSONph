
import Foundation

class DetailTodoViewModel: ObservableObject {
    @Published var todo: Todo
    init(todo: Todo) {
        self.todo = todo

        getData()
    }
    
    
    func getData() {
        
    }
}

