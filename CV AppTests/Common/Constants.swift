import Foundation

// MARK: - Mocking url as string
enum URLString: String {
    case base = "https://api.myjson.com/bins/"
    case failBase = "https://api.myFAILjson.com/bins/"
    case image = "https://image.png"
    case dummy = "https://www.dummy.com"
    case httpsProtocol = "https"
}

// MARK: - Extensions of source files
enum ExtensionFile: String {
    case json = "json"
}

// MARK: - Assets files
enum Asset: String {
    case basicInformation = "basicInformation"
    case careerInformation = "careerInformation"
    case failBasicInformation = "failBasicInformation"
    case failCareerInformation = "failCareerInformation"
}

// MARK: - Types of fails
enum Fail: String {
    case mocking = "Failed at getting mock info"
    case createURL = "Couldn't create an URL"
    case loadData = "The data could not be loaded"
    case dataNil = "This data must be nill"
    case notDisplayInformation = "View could not displayed the information"
    case careerNotTableView = "Career table view is not available"
    
}

// MARK: - Types of expectations
enum Expectation: String {
    case request = "Test a request with a valid url base, and valid URLSession"
    case invalidRequest = "Test a request with an invalid url base, and valid URLSession"
    case noConnectionRequest = "Test request with a valid url base, and a URLSession whit 0 at code response"
}
