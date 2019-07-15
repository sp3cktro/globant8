import UIKit
@testable import CV_App

final class MockMyCareerRouter: MyCareerRouterProtocol {
    
    static func createModule() -> UIViewController {
        return UIViewController()
    }
}
