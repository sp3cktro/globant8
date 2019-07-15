import XCTest
@testable import CV_App

class BasicInformationPresenter: XCTestCase, CommonMethods {
    var sut: MainPresenter?
    
    override func setUp() {
        super.setUp()
        sut = MainPresenter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchBasicInfoCalled() {
        let mockInteractor = MockMainInputInteractor()
    
        sut?.interactor = mockInteractor
        sut?.updateView()
        
        XCTAssert(mockInteractor.fetchUserInfoCalled > 0)
    }
    
    func testFetchGetImageCalled() {
        let mockInteractor = MockMainInputInteractor()
        
        sut?.interactor = mockInteractor
        sut?.getImage(imageURL: URLString.dummy.rawValue)
        
        XCTAssert(mockInteractor.fetchImageCalled > 0)
    }
    
    func testMyCareerPushed() {
        let mockRouter = MockMainRouter()
        
        sut?.router = mockRouter
        sut?.myCareerPressed()
        
        XCTAssert(mockRouter.pushMyCareerCalled > 0)
    }
    
    func testDisplayUserInfoCalled() {
        let mockView = MockUserInfoView()
        let data = getDataFrom(file: Asset.basicInformation.rawValue)
        guard let user = try? JSONDecoder().decode(UserInfo.self, from: data) else {
            XCTFail()
            return
        }
        
        sut?.view = mockView
        sut?.userFetched(user: user)
        
        XCTAssert(mockView.showUserInfoCalled > 0)
    }
    
    func testDisplayFailedFetch() {
        let mockView = MockUserInfoView()
        
        sut?.view = mockView
        sut?.userFetchFailed()
        
        XCTAssert(mockView.showNetworkingCalled > 0)
    }
    
    func testDisplayDowloadedImage() {
        let mockView = MockUserInfoView()
        guard let data = MockData().getBasicInformationData() else {
            XCTFail()
            return
        }
        
        sut?.view = mockView
        sut?.dowloadedImage(data)
        
        XCTAssert(mockView.imageWithDataCalled > 0)
    }
}
