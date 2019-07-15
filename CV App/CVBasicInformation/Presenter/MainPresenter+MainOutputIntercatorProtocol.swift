import Foundation

//MARK: - Extension for MainOutputInteractor
extension MainPresenter: MainOutputInteractorProtocol {
    func userFetched(user: UserInfo) {
        view?.showUserInfo(with: user)
    }
    
    func userFetchFailed() {
        view?.showNetworkingError()
    }
    
    func dowloadedImage(_ data: Data){
        view?.imageWithData(data: data)
    }
}
