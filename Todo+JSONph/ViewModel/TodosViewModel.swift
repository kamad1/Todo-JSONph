
import Foundation

class TodosViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    
    init() {
        getData()
    }
    
    func getData() {
        Task {
            do {
                let todos = try await NetworkService.shared.getAllTodos()
                DispatchQueue.main.async {
                    self.todos = todos
                    print(todos.count)
                }
            } catch {
               print(error)
           }
        }
    }
    
    func sendTodo(title: String, userId: Int) {
        let newTodo = Todo(id: 0, userId: userId, title: title, completed: false)
        Task {
            let todo = try await NetworkService.shared.createTodo(newTodo)
            DispatchQueue.main.async {
                self.todos.insert(todo, at: 0)
            }
        }
    }
    
    func delete(_ todo: Todo) {
        Task {
            try await NetworkService.shared.deleteTodo(todo)
            DispatchQueue.main.async { self.todos.removeAll { $0.id == todo.id } }
        }
    }
}
