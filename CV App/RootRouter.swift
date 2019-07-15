import UIKit

struct RootRouter {
    /**
     Method that set the initial rootViewController.
     
     - Parameters:
        - window: initial UIWindow.
     */
    func presentUserInfoScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = UserRouter.createModule()
    }
}
