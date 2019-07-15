import XCTest
@testable import CV_App

protocol CommonMethods {
    func getDataFrom(file: String) -> Data
}

extension CommonMethods where Self: AnyObject {
    func getDataFrom(file: String) -> Data {
        guard let path = Bundle(for: type(of: self)).url(forResource: file, withExtension: ExtensionFile.json.rawValue) else {
            return Data()
        }
        guard let data  = try? Data(contentsOf: path) else {
            return Data()
        }
        return data
    }
}
