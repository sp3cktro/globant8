import Foundation
@testable import CV_App

final class MockMyCareerInteractor: MyCareerInputInteractorProtocol {
    
    var presenter: MyCareerOutputInteractorProtocol?
    var fetchMyCareerCalled = 0
    
    func fetchMyCareer(endpoint: String) {
        fetchMyCareerCalled += 1
    }
}
