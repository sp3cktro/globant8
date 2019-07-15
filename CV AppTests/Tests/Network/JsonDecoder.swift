import XCTest
@testable import CV_App

class JsonDecoder: XCTestCase, CommonMethods {
    
    func testUserInformationDecodeWithValidData() {
        let model: UserInfo?
        let data = getDataFrom(file: Asset.basicInformation.rawValue)
        model = try? JSONDecoder().decode(UserInfo.self, from: data)
        XCTAssertNotNil(model)
    }
    
    func testUserInformationDecodeWithInvalidData() {
        var model: UserInfo?
        let data = getDataFrom(file: Asset.failBasicInformation.rawValue)
        model = try? JSONDecoder().decode(UserInfo.self, from: data)
        XCTAssertNil(model)
    }
    
    func testUserInformationDecodeDataNil() {
        var model: UserInfo?
        let data = Data()
        model = try? JSONDecoder().decode(UserInfo.self, from: data)
        XCTAssertNil(model)
    }
    
    func testCarerrInformationDecodeWithValidData() {
        let model: MyCareer?
        let data = getDataFrom(file: Asset.careerInformation.rawValue)
        model = try? JSONDecoder().decode(MyCareer.self, from: data)
        XCTAssertNotNil(model)
    }
    
    func testCareerInformationDecodeWithInvalidData() {
        var model: MyCareer?
        let data = getDataFrom(file: Asset.failCareerInformation.rawValue)
        model = try? JSONDecoder().decode(MyCareer.self, from: data)
        XCTAssertNil(model)
    }
    
    func testCareerInformationDecodeDataNil() {
        var model: MyCareer?
        let data = Data()
        model = try? JSONDecoder().decode(MyCareer.self, from: data)
        XCTAssertNil(model)
    }
}
