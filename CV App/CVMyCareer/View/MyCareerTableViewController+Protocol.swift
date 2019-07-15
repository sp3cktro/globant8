import UIKit

extension MyCareerTableViewController: MyCareerViewControllerProtocol  {
    func showMyCareer(with myCareer: MyCareer) {
        self.myCareerMeList = myCareer
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    /**
     Method that display the alert when occurs an network error.
     */
    func showNetworkingError() {
        let alertTitle = NSLocalizedString(StringKey.titleError.rawValue, comment: Comment.titleError.rawValue)
        let alertMessage = NSLocalizedString(StringKey.messageError.rawValue, comment: Comment.messageError.rawValue)
        self.alertView = AlertView(title: alertTitle, message: alertMessage, preferredStyle: .actionSheet)
        self.alertView?.addAction(UIAlertAction(title: NSLocalizedString(StringKey.refreshAction.rawValue, comment: Comment.refreshAction.rawValue), style: .default, handler: { (action) in
            self.presenter?.updateView()
        }))
        DispatchQueue.main.async { [weak self] in
            self?.present(self?.alertView ?? UIAlertController(), animated: true)
        }
    }
}
