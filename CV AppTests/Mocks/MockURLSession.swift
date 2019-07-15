import Foundation
@testable import CV_App

final class MockURLSession: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) -> URLSessionDataTask {
        defer { completionHandler(data, response, error) }
        return MockDataTask(completionHandler: completionHandler)
    }
}
