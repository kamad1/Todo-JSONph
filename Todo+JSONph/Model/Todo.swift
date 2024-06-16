
import Foundation

struct Todo: Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var completed: Bool
}
