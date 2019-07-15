import UIKit

extension UIView {
    func circled() {
        self.clipsToBounds =  true
        layer.cornerRadius = max(bounds.height, bounds.width) / CGFloat(NumberF.half.rawValue)
    }
}

