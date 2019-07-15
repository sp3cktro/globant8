import XCTest
@testable import CV_App

class NetworkLayer: XCTestCase, CommonMethods {

    func testRequest() {
        let client: Request
        let baseStr = URLString.base.rawValue
        let endPoint = EndPoint.userInfo.rawValue
        guard let baseURL = URL(string: baseStr) else {
            XCTFail(Fail.createURL.rawValue)
            return
        }
        
        let sessionURL = MockURLSession()
        sessionURL.data = getDataFrom(file: Asset.basicInformation.rawValue)
        sessionURL.response = HTTPURLResponse(url: baseURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: Expectation.request.rawValue)
        client = Request(baseURL: baseStr, session: sessionURL)
        
        client.request(endPoint, entity: UserInfo.self) { fetchResult in
            switch fetchResult {
            case .success(data: _):
                expectation.fulfill()
            case .failure( _):
                XCTFail(Fail.loadData.rawValue)
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testInvalidURLBaseRequest() {
        let client: Request
        let baseStr = URLString.failBase.rawValue
        let endPoint = EndPoint.userInfo.rawValue
        guard let baseURL = URL(string: baseStr) else {
            XCTFail(Fail.createURL.rawValue)
            return
        }
        
        let sessionURL = MockURLSession()
        sessionURL.data = nil
        sessionURL.response = HTTPURLResponse(url: baseURL, statusCode: 400, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: Expectation.invalidRequest.rawValue)
        client = Request(baseURL: baseStr, session: sessionURL)
        
        client.request(endPoint, entity: UserInfo.self) { fetchResult in
            switch fetchResult {
            case .success(data: _):
                XCTFail(Fail.dataNil.rawValue)
            case .failure( _):
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testNOInternetConnection() {
        let client: Request
        let baseStr = URLString.base.rawValue
        guard let baseURL = URL(string: baseStr) else {
            XCTFail(Fail.createURL.rawValue)
            return
        }
        
        let session = MockURLSession()
        session.response = HTTPURLResponse(url: baseURL, statusCode: 0, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: Expectation.noConnectionRequest.rawValue)
        client = Request(baseURL: baseStr, session: session)
        
        client.request(EndPoint.userInfo.rawValue, entity: UserInfo.self) { (fetchResult) in
            switch fetchResult {
            case .success(data: _):
                XCTFail(Fail.dataNil.rawValue)
            case .failure( _):
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testEndPointCareerInformationRequest() {
        let client: Request
        let baseStr = URLString.base.rawValue
        let endPoint = EndPoint.myCareer.rawValue
        guard let baseURL = URL(string: baseStr) else {
            XCTFail(Fail.createURL.rawValue)
            return
        }
        
        let sessionURL = MockURLSession()
        sessionURL.data = getDataFrom(file: Asset.careerInformation.rawValue)
        sessionURL.response = HTTPURLResponse(url: baseURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: Expectation.request.rawValue)
        client = Request(baseURL: baseStr, session: sessionURL)
        
        client.request(endPoint, entity: MyCareer.self) { fetchResult in
            switch fetchResult {
            case .success(data: _):
                expectation.fulfill()
            case .failure( _):
                XCTFail(Fail.loadData.rawValue)
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testInvalidEndPointCareerInformationRequest() {
        let client: Request
        let baseStr = URLString.failBase.rawValue
        let endPoint = EndPoint.userInfo.rawValue
        guard let baseURL = URL(string: baseStr) else {
            XCTFail(Fail.createURL.rawValue)
            return
        }
        
        let sessionURL = MockURLSession()
        sessionURL.data = nil
        sessionURL.response = HTTPURLResponse(url: baseURL, statusCode: 400, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: Expectation.invalidRequest.rawValue)
        client = Request(baseURL: baseStr, session: sessionURL)
        
        client.request(endPoint, entity: MyCareer.self) { fetchResult in
            switch fetchResult {
            case .success(data: _):
                XCTFail(Fail.dataNil.rawValue)
            case .failure( _):
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
