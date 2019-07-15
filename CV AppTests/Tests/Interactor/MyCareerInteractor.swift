import XCTest
@testable import CV_App

class MyCareerInteractorTest: XCTestCase {
    var session: MockURLSession?
    
    override func setUp() {
        super.setUp()
        session = MockURLSession()
    }
    
    override func tearDown() {
        session = nil
        super.tearDown()
    }
    
    func testFetchMyCareer() {
        guard let data = MockData().getCareerInformationData(),
            let session = self.session else {
            XCTFail(Fail.mocking.rawValue)
            return
        }
        
        session.data = data
        session.error = nil
        
        let client = Request(session: session)
        
        let sut = MyCareerInteractor(client)
        let mockPresenter = MockMyCareerPresenter()
        sut.presenter = mockPresenter
        
        sut.fetchMyCareer(endpoint: URLString.dummy.rawValue)
        
        XCTAssert(mockPresenter.careerFetchedCalled > 0)
    }
    
    func testFetchMyCareerDataDecodingFailed() {
        guard let session = self.session else {
            XCTFail()
            return
        }
        
        session.data = MockData().getCareerInvalidInformationData()
        session.error = nil
        
        let client = Request(session: session)
        
        let sut = MyCareerInteractor(client)
        let mockPresenter = MockMyCareerPresenter()
        sut.presenter = mockPresenter
        
        sut.fetchMyCareer(endpoint: URLString.dummy.rawValue)
        
        XCTAssert(mockPresenter.careerFetchFailedCalled > 0)
    }
    
    func testFetchMyCareerFailed() {
        guard let session = self.session else {
            XCTFail()
            return
        }
        
        session.data = nil
        session.error = NetworkingErrors.invalidRequest
        
        let client = Request(session: session)
        
        let sut = MyCareerInteractor(client)
        let mockPresenter = MockMyCareerPresenter()
        sut.presenter = mockPresenter
        
        sut.fetchMyCareer(endpoint: URLString.dummy.rawValue)
        
        XCTAssert(mockPresenter.careerFetchFailedCalled > 0)
    }
}
