import XCTest
@testable import CV_App

class BasicInformationRouter: XCTestCase {
    func testCreateModule() {
        let sut = MockMainRouter.createModule()
        XCTAssertNotNil(sut)
    }
    
    func testMainRouterProtocol() {
        let sut = MockMainRouter()
        
        sut.pushMyCareer()
        
        XCTAssert(sut.pushMyCareerCalled > 0)
        
    }
}
