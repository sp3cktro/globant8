import UIKit

final class CircleButtonFactory {
    private init() {}
    
    static func createCircleButton() -> UIButton {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle(Button.plus.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.circleButton, weight: .bold)
        
        button.backgroundColor = .customRed
        
        return button
    }
}
