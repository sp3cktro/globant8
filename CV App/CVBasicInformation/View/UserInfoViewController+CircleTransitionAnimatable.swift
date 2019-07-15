import UIKit

extension UserInfoViewController: CircleTransitionAnimatable {
    var circleFrame: CGRect {
        return moreInfoButton?.frame ?? .zero
    }
}
