import UIKit
@testable import CV_App

final class MockUserInfoView: MainViewControllerProtocol {
    
    var showUserInfoCalled = 0
    var showNetworkingCalled = 0
    var imageWithDataCalled = 0
    
    func showUserInfo(with user: UserInfo) {
        showUserInfoCalled += 1
    }
    
    func showNetworkingError() {
        showNetworkingCalled += 1
    }
    
    func imageWithData(data: Data) {
        imageWithDataCalled += 1
    }
}
