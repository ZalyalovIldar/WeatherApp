import Foundation
//    MARK: realisation of method fetch
extension APIClient {
    func fetch<V: Codable>(with request: URLRequest, completion: @escaping (Either<V, APIError>) -> Void) {
        let task = session.dataTask(with: request) { (data, responce, error) in
            guard error == nil else {
                completion(.error(.apiError));
                return
            }
            guard let responce = responce as? HTTPURLResponse, 200..<300 ~= responce.statusCode else {
                completion(.error(.badResponse))
                return
            }
            guard let value = try? JSONDecoder().decode(V.self, from: data!) else {
                completion(.error(.jsonDecoder))
                return
            }
            completion(.value(value))
        }
        task.resume()
    }
}

extension EndPoint {
    var urlComponent: URLComponents {
        var component = URLComponents(string: baseURL)
        component?.path = path
        component?.queryItems = queryItems
        
        return component!
    }
    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
    
}
