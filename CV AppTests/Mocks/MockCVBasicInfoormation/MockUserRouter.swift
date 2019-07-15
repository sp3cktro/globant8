import UIKit
@testable import CV_App

final class MockMainRouter: MainRouterProtocol{
    
    private(set) var view: UIViewController?
    var pushMyCareerCalled = 0
    var createModuleCalled = 0
    
    static func createModule() -> UINavigationController {
        return UINavigationController()
    }
    
    func pushMyCareer() {
        pushMyCareerCalled += 1
    }
    
}
