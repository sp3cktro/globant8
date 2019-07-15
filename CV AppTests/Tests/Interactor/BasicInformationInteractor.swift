
import XCTest
@testable import CV_App

class BasicInformationInteractor: XCTestCase {
    var session: MockURLSession?
    
    override func setUp() {
        super.setUp()
        
        session = MockURLSession()
    }
    
    override func tearDown() {
        session = nil
        
        super.tearDown()
    }
    
    func testFetchBasicInfoCalled() {
        guard let data = MockData().getBasicInformationData(),
            let session = session else {
                XCTFail(Fail.mocking.rawValue)
                return
        }
        
        session.data = data
        session.error = nil
        
        let client = Request(session: session)
        
        let sut = MainInteractor(client)
        let mockPresenter = MockMainPresenter()
        
        sut.presenter = mockPresenter
        sut.fetchUserInfo(endpoint: URLString.dummy.rawValue)
        
        XCTAssert(mockPresenter.userFetchedCalled > 0)
    }
    
    func testFetchGetImageCalled() {
        guard let data = MockData().getBasicInformationData(),
            let session = session else {
            XCTFail(Fail.mocking.rawValue)

            return
        }
        
        session.data = data
        session.error = nil
        
        let client = Request(session: session)
        
        let sut = MainInteractor(client)
        let mockPresenter = MockMainPresenter()
        
        sut.presenter = mockPresenter
        sut.fetchImage(imageURL: URLString.dummy.rawValue)
        
        XCTAssert(mockPresenter.downloadedImageCalled > 0)
    }
    
    func testFetchBasicInfoFailed() {
        guard let session = session else {
            XCTFail()
            return
        }
        
        session.data = MockData().getInvalidInformationData()
        session.error = nil
        
        let client = Request(session: session)
        
        let sut = MainInteractor(client)
        let mockPresenter = MockMainPresenter()
        
        sut.presenter = mockPresenter
        sut.fetchUserInfo(endpoint: URLString.dummy.rawValue)
        
        XCTAssert(mockPresenter.userFetchFailedCalled > 0)
    }
}
