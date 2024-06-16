
import SwiftUI

struct TodosView: View {
    @StateObject var viewModel = TodosViewModel()
    @State private var showNewTodoAlert = false
    @State private var newTodoTitle = ""
    @State private var newTodoUserId: Int = 1
    
    var body: some View {
        List(viewModel.todos) { todo in
            NavigationLink {
                DetailTodoView(viewModel: .init(todo: todo))
                    
            } label: {
                Text(todo.title)
                    .background(.clear)
            }
            .listRowSeparator(.hidden)
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button  {
                    viewModel.delete(todo)
                } label: {
                    Image(systemName: "trash")
                        .tint(.red)
                }
            }
        }
        .background(.yellow)
        .listStyle(.plain)
        .listRowBackground(Color.clear)
        .onAppear {
            UITableViewCell.appearance().backgroundColor = .clear
//            UITableView.appearance().backgroundColor = .clear
        }

        .overlay(alignment: .bottomTrailing) {
            Button {
                showNewTodoAlert.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .frame(width: 60, height: 60)
                    .background(.blue)
                    .clipShape(.circle)
                    .padding(8)
                    .foregroundStyle(.white)
                    .contextMenu(ContextMenu(menuItems: {
                        Button("Удалить", role: .destructive) {
                            
                        }
                    }))
            }
        }
        .overlay {
            if showNewTodoAlert {
                Rectangle().ignoresSafeArea().opacity(0.5)
                    .onTapGesture {
                        showNewTodoAlert = false
                        newTodoTitle = ""
                        newTodoUserId = 1
                    }
            }
        }
        .overlay {
            if showNewTodoAlert {
                VStack(spacing: 24) {
                    Text("Новая задача").font(.title3.bold())
                    VStack {
                        TextField("Название задачи", text: $newTodoTitle)
                        HStack {
                            Stepper("ID исполнителя", value: $newTodoUserId)
                            Text("\(newTodoUserId)")
                                .frame(width: 20)
                        }
                    }
                    Button("Сохранить") {
                        viewModel.sendTodo(title: self.newTodoTitle, userId: newTodoUserId)
                        newTodoUserId = 1
                        newTodoTitle = ""
                        showNewTodoAlert = false
                    }
                    .frame(width: 160, height: 40)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadii: .init(topLeading: 12, 
                                                        bottomLeading: 4,
                                                        bottomTrailing: 16,
                                                        topTrailing: 6)))
                }
                .frame(width: 280, height: 160)
                .padding(24)
                .background(.white)
                .clipShape(.rect(cornerRadii: .init(topLeading: 12,
                                                    bottomLeading: 50, 
                                                    bottomTrailing: 8,
                                                    topTrailing: 40)))
                
            }
        }
    }
}

#Preview {
    ContentView()
}
