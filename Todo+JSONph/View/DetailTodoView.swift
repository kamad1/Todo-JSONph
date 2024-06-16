
import SwiftUI

struct DetailTodoView: View {
    @StateObject var viewModel: DetailTodoViewModel
    
    var body: some View {
        VStack {
            TextField("Название задачи", text: $viewModel.todo.title)
            Toggle("Выполнена?", isOn: $viewModel.todo.completed)
            Stepper("ID исполнителя", value: $viewModel.todo.userId, in: 1...10, step: 1)
                .overlay {
                    Text("\(viewModel.todo.userId)")
                }
          
               
        }
        .onChange(of: viewModel.todo.userId) { oldValue, newValue in
            print(newValue)
            //TODO: - Получить данные о новом юзере по UserID
            //т.е. Написать модель, эндпойнт /users/3, получить и распарсить данные и вывести их во View
        }
    }
}

//#Preview {
//    DetailTodoView()
//}
