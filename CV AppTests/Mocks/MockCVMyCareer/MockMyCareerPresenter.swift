import Foundation
@testable import CV_App

final class MockMyCareerPresenter: MyCareerPresenterProtocol {
    var interactor: MyCareerInputInteractorProtocol?
    var view: MyCareerViewControllerProtocol?
    var router: MyCareerRouterProtocol?
    var updateViewCalled = 0
    var careerFetchedCalled = 0
    var careerFetchFailedCalled = 0
    
    func updateView() {
        updateViewCalled += 1
    }
}

// MARK: - Extension for MyCareerOutputIntercator
extension MockMyCareerPresenter: MyCareerOutputInteractorProtocol {
    func myCareerFeteched(myCareer: MyCareer) {
        careerFetchedCalled += 1
    }
    
    func userFetchFailed() {
        careerFetchFailedCalled += 1
    }
}
