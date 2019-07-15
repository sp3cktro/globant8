import Foundation

protocol RequestProtocol {
    func request<T:Codable>(_ endpoint: String, entity: T.Type, completionHandler: @escaping (Result<Data, NetworkingErrors>) -> Void)
    func downloadImage(urlImage: String, completionHandler: @escaping (Result<Data, NetworkingErrors>) -> Void)
    func jsonDecode<T: Decodable>(data: Data) -> T?
}

protocol URLSessionProtocol{
    func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}
