import UIKit

final class AlertView: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let alertTitle = title else { return }
        let attributedTitle = NSAttributedString(string: alertTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: FontSize.alertTile), NSAttributedString.Key.foregroundColor : UIColor.black])
        setValue(attributedTitle, forKey: StringKey.attributedTitle.rawValue)
        
        guard let alertMessage = message else { return }
        let attributedMessage = NSAttributedString(string: alertMessage, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: FontSize.alertMessage), NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        setValue(attributedMessage, forKey: StringKey.attributedMessage.rawValue)
        
        view.tintColor = .customRed
    }
}
