import UIKit

class UserRouter: MainRouterProtocol {
    weak var viewController: UIViewController?
    
    // MARK: - Methods
    /**
     Method that sets the rootViewController. Creates the layers and connect them.
     */
    static func createModule() -> UINavigationController {
        let router = UserRouter()
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        
        guard let view = UIStoryboard(name: Storyboard.userInfo.rawValue, bundle: nil).instantiateViewController(withIdentifier: Controller.cvInformation.rawValue) as? UserInfoViewController else { return UINavigationController() }
        
        let navigation = UINavigationController(rootViewController: view)
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        navigation.isNavigationBarHidden = false
        return navigation
    }
    
    /**
     Method for present the My career section.
     */
    func pushMyCareer() {
        let myCareerViewController = MyCareerRouter.createModule()
        viewController?.navigationController?.pushViewController(myCareerViewController, animated: true)
    }
}
