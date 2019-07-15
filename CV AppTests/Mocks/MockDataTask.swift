import Foundation

final class MockDataTask: URLSessionDataTask {
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
    
    init(completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        self.completionHandler = completionHandler
    }
    
    override func resume() { }
}
