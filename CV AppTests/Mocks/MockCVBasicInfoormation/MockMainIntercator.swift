import UIKit
@testable import CV_App

final class MockMainInputInteractor: MainInputInteractorProtocol {
    
    var presenter: MainOutputInteractorProtocol?
    var fetchImageCalled = 0
    var fetchUserInfoCalled = 0
    
    func fetchImage(imageURL: String) {
        self.fetchImageCalled += 1
    }
    
    func fetchUserInfo(endpoint: String) {
        self.fetchUserInfoCalled += 1
    }
}
