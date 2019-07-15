import Foundation
@testable import CV_App

final class MockRequest: RequestProtocol {
    
    private let session: URLSessionProtocol
    private var baseURL: URL?
    
    init(baseURL: String, session: URLSessionProtocol = URLSession.shared) {
        self.session = session
        guard let url = URL(string: baseURL) else { return }
        self.baseURL = url
    }
    
    func request<T>(_ endpoint: String, entity: T.Type, completionHandler: @escaping (Result<Data, NetworkingErrors>) -> Void) where T : Decodable, T : Encodable {
        guard let url = baseURL?.appendingPathComponent(endpoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = HTTP.get.rawValue
        session.dataTask(with: request) { data, reponse, error  in
            guard error == nil else{
                completionHandler(.failure(.netWorkError))
                return
            }
            guard let dataFetched = data, let _ : T = self.jsonDecode(data: dataFetched) else{
                completionHandler(.failure(.invalidData))
                return
            }
            completionHandler(.success(dataFetched))
            }.resume()
    }
    
    func downloadImage(urlImage: String, completionHandler: @escaping (Result<Data, NetworkingErrors>) -> Void) {
        guard let url = URL(string: urlImage) else {
            completionHandler(.failure(.invalidRequest))
            return
        }
        let requestImage = URLRequest(url: url)
        session.dataTask(with: requestImage){ data, response, error in
            guard error == nil else{
                completionHandler(.failure(.netWorkError))
                return
            }
            guard let fetchedData = data else{
                completionHandler(.failure(.invalidData))
                return
            }
            completionHandler(.success(fetchedData))
            }.resume()
    }
    
    func jsonDecode<T>(data: Data) -> T? where T : Decodable {
        let jsonDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}
