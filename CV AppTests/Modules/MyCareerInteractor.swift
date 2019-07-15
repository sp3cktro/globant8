
import XCTest
@testable import CV_App

class MyCareerInteractor: XCTestCase {
    func testFetchMyCareer() {
        let sut = MockMyCareerInteractor()
        let presenter = MockMyCareerPresenter()
        
        sut.presenter = presenter
        sut.fetchMyCareer(endpoint: URLString.httpsProtocol.rawValue)
    }
}
