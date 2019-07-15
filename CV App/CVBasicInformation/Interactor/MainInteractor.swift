import Foundation

class MainInteractor: MainInputInteractorProtocol {
    // MARK: - Properties
    private var client: Request
    
    init(_ client: Request = Request()) {
        self.client = client
    }
    
    var presenter: MainOutputInteractorProtocol?
    
    // MARK: - Methods
    /**
    Method for create and fetch the request.
     
     - Parameters:
        - endpoint: endpoint to request.
     */
    func fetchUserInfo(endpoint: String) {
        client.request(endpoint, entity: UserInfo.self ) { [weak self] fetchResult in
            switch fetchResult {
            case .success(let data):
                let userFetch: UserInfo? = self?.client.jsonDecode(data: data)
                guard  let user = userFetch, let _ = self?.presenter?.userFetched(user: user) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
    
    /**
     Method for create and fetch the image.
     
     - Parameters:
     - imageURL: imageURL to fetch.
     */
    func fetchImage(imageURL: String){
        client.downloadImage(urlImage: imageURL) { [weak self] fetchingImage in
            switch fetchingImage{
            case .success(let data):
                self?.presenter?.dowloadedImage(data)
            case .failure(_):
                break
            }
        }
    }
}
