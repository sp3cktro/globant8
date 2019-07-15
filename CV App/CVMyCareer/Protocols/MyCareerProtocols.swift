import UIKit

// MARK: - Protocols
/**
 Presenter -> View Protocol.
 */
protocol MyCareerViewControllerProtocol: class{
    func showMyCareer (with myCareer:  MyCareer)
    func showNetworkingError()
}

/**
 View -> Presenter Protocol.
 */
protocol MyCareerPresenterProtocol{
    var view: MyCareerViewControllerProtocol? { get set }
    var interactor: MyCareerInputInteractorProtocol? { get set }
    var router: MyCareerRouterProtocol? { get set }
    
    func updateView()
}

/**
 Presenter -> Interactor Protocol.
 */
protocol MyCareerInputInteractorProtocol{
    var presenter: MyCareerOutputInteractorProtocol? { get set }
    func fetchMyCareer (endpoint: String)
    
}

/**
 Interactor -> Presenter Protocol.
 */
protocol MyCareerOutputInteractorProtocol{
    func myCareerFeteched(myCareer: MyCareer)
    func userFetchFailed()
}

/**
 Presenter -> Router Protocol.
 */
protocol MyCareerRouterProtocol{
    static func createModule() -> UIViewController
}
