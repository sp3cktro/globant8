import Foundation

final class MainPresenter: MainPresenterProtocol {
    // MARK: - Properties
    var view: MainViewControllerProtocol?
    var interactor: MainInputInteractorProtocol?
    var router: MainRouterProtocol?
    
    func updateView() {
        interactor?.fetchUserInfo(endpoint: EndPoint.userInfo.rawValue)
    }
    
    func getImage(imageURL: String){
        interactor?.fetchImage(imageURL: imageURL)
    }
    
    func myCareerPressed() {
        router?.pushMyCareer()
    }  
}

