import XCTest
@testable import CV_App

class MyCareerInformationRouter: XCTestCase {
    func testCreateModule() {
        let sut = MockMyCareerRouter.createModule()
        XCTAssertNotNil(sut)
    }
}
