
import Foundation

class ParsingService {
    static let shared = ParsingService(); private init() { }
    private let decoder: JSONDecoder = {
        var decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private let encoder = JSONEncoder()
    
    func todos(fromData data: Data) -> [Todo]? { try? decoder.decode([Todo].self, from: data) }
    func todo(fromData data: Data) -> Todo? { try? decoder.decode(Todo.self, from: data) }
    func jsonFrom(todo: Todo) -> Data? { try? encoder.encode(todo) }
    
    func users(fromData data: Data) -> [User]? { try? decoder.decode([User].self, from: data) }
    func user(fromData data: Data) -> User? { try? decoder.decode(User.self, from: data) }
//    func jsonFromUser(user: User) -> Data? { try? encoder.encode(user) }
    
}
