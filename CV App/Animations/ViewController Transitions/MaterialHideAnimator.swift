import UIKit

final class MaterialHideAnimator: NSObject { }

extension MaterialHideAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TransitionAnimationDuration.hideDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from),
            let overViewController = toViewController as? CircleTransitionAnimatable
            else {
                return
        }
        
        let blackView = UIView(frame: fromViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        toViewController.view.addSubview(blackView)
        
        let transitionContainer = transitionContext.containerView
        transitionContainer.addSubview(toViewController.view)
        transitionContainer.addSubview(fromViewController.view)
        
        let animationTiming = UICubicTimingParameters(animationCurve: .easeInOut)
        
        let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), timingParameters: animationTiming)
        
        animator.addAnimations {
            fromViewController.view.frame = overViewController.circleFrame
            fromViewController.view.layer.cornerRadius = overViewController.circleFrame.height / 2
            blackView.alpha = 0
        }
        
        animator.addCompletion { finished in
            blackView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        animator.startAnimation()
    }
}
