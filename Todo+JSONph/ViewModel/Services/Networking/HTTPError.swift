
import Foundation

enum HTTPError: Error {
    case invalidURL, badRequest, badResponce, invalidDecoding, invalidEncoding, unknownError
}
