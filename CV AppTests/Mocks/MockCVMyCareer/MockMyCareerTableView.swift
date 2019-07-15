import Foundation
@testable import CV_App

final class MockMyCareerTableView: MyCareerViewControllerProtocol {
    
    var showMyCareerCalled = 0
    var showNetworkingCalled = 0
    
    func showMyCareer(with myCareer: MyCareer) {
        showMyCareerCalled += 1
    }
    
    func showNetworkingError() {
        showNetworkingCalled += 1
    }
}
