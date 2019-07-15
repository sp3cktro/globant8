import Foundation

final class MyCareerInteractor: MyCareerInputInteractorProtocol {
    // MARK: - Properties
    var presenter: MyCareerOutputInteractorProtocol?
    var positionTable = [[String : AnyObject]]()
    private var client: Request
    
    init(_ client: Request = Request()) {
        self.client = client
    }
    // MARK: - Methods
    /**
     Method for create and fetch the request.
     
     - Parameters:
        - endpoint: endpoint to request.
     */
    func fetchMyCareer(endpoint: String) {
        client.request(endpoint, entity: MyCareer.self) { [weak self] fetchResult in
            switch fetchResult{
            case .success(let data):
                guard let myCareerFetch: MyCareer = self?.client.jsonDecode(data: data) else {
                    self?.presenter?.userFetchFailed()
                    return
                }
                guard let _ = self?.presenter?.myCareerFeteched(myCareer: myCareerFetch) else{
                    self?.presenter?.userFetchFailed()
                    return
                }
            case .failure(_):
                self?.presenter?.userFetchFailed()
            }
        }
    }
}
