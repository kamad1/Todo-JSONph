
import Foundation

class URLManager {
    static let shared = URLManager(); private init() { }
    
    private let server = "jsonplaceholder.typicode.com"
    private let getaway = "https://"

    func createURL(endpoint: Endpoint, id: Int? = nil) -> URL? {
        var urlStr = getaway + server + endpoint.rawValue
        if let id {
            urlStr += "/\(id)"
        }
        print(urlStr)
        return URL(string: urlStr)
    }
    
}
