
import Foundation

class NetworkService {
    static let shared = NetworkService(); private init() { }
    private let session = URLSession.shared
    
    //Retrieve (Read)
    func getAllTodos() async throws -> [Todo] {
        guard let url = URLManager.shared.createURL(endpoint: .todos) else { throw HTTPError.invalidURL }
        let (data, response) = try await session.data(from: url)
        
        let statusCode = (response as! HTTPURLResponse).statusCode
        guard statusCode / 100 == 2 else {
            switch statusCode / 100 {
            case 4: throw HTTPError.badRequest
            case 5: throw HTTPError.badResponce
            default: throw HTTPError.unknownError
            }
        }
        
        guard let todos = ParsingService.shared.todos(fromData: data) else { throw HTTPError.invalidDecoding }
        
        return todos
    }
    
    
    //Create
    func createTodo(_ todo: Todo) async throws -> Todo {
        guard let url = URLManager.shared.createURL(endpoint: .todos) else { throw HTTPError.invalidURL }
        guard let reqData = ParsingService.shared.jsonFrom(todo: todo) else { throw HTTPError.invalidEncoding }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
        request.httpBody = reqData
        
        let (data, _) = try await session.data(for: request)
        guard let resTodo = ParsingService.shared.todo(fromData: data) else { throw HTTPError.invalidDecoding }
        
        return resTodo
    }
    
    //Delete
    func deleteTodo(_ todo: Todo) async throws {
        guard let url = URLManager.shared.createURL(endpoint: .todos, id: todo.id) else { throw HTTPError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.DELETE.rawValue
        
        let (_, response) = try await session.data(for: request)
        switch (response as! HTTPURLResponse).statusCode / 100 {
        case 2: break
        case 4: throw HTTPError.badRequest
        case 5: throw HTTPError.badResponce
        default: throw HTTPError.unknownError
        }
    }
    
    func getAllUser() async throws -> [User] {
        guard let url = URLManager.shared.createURL(endpoint: .user) else { throw HTTPError.invalidURL }
        print(url)
        let (data, response) = try await session.data(from: url)
        
        let statusCode = (response as! HTTPURLResponse).statusCode
        guard statusCode / 100 == 2 else {
            switch statusCode / 100 {
            case 4: throw HTTPError.badRequest
            case 5: throw HTTPError.badResponce
            default: throw HTTPError.unknownError
            }
        }
        
        guard let user = ParsingService.shared.users(fromData: data) else { throw HTTPError.invalidDecoding }
        
        return user
    }
    
}
