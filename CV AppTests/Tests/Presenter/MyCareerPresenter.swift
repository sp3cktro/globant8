import XCTest
@testable import CV_App

class MyCareerPresenterTest: XCTestCase {
    var sut: MyCareerPresenter?
    var interactor: MockMyCareerInteractor?
    
    override func setUp() {
        super.setUp()
        sut = MyCareerPresenter()
        interactor = MockMyCareerInteractor()
        
        sut?.interactor = interactor
    }
    
    override func tearDown() {
        interactor = nil
        sut = nil
        super.tearDown()
    }
    
    func testUpdateView() {
        guard let sut = sut,
            let interactor = interactor else {
            XCTFail()
            return
        }
        
        sut.updateView()
        
        XCTAssert(interactor.fetchMyCareerCalled > 0)
    }
    
    func testUserFetchFailed() {
        guard let sut = sut else {
            XCTFail()
            return
        }
        
        let view = MockMyCareerTableView()
        sut.view = view
        
        sut.userFetchFailed()
        
        XCTAssert(view.showNetworkingCalled > 0)
    }
    
    func testMyCareerFetched() {
        guard let sut = sut else {
            XCTFail()
            return
        }
        
        let view = MockMyCareerTableView()
        
        sut.interactor = interactor
        sut.view = view
        
        guard let data = MockData().getCareerInformationData(),
            let career = try? JSONDecoder().decode(MyCareer.self, from: data) else {
                XCTFail()
                return
        }
        
        sut.myCareerFeteched(myCareer: career)
        
        XCTAssert(view.showMyCareerCalled > 0)
    }
}
