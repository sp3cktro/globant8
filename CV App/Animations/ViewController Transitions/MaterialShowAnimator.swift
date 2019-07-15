import UIKit

final class MaterialShowAnimator: NSObject { }

extension MaterialShowAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TransitionAnimationDuration.showDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from),
            let overViewController = fromViewController as? CircleTransitionAnimatable
            else {
                return
        }
        
        let blackView = UIView(frame: fromViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0
        fromViewController.view.addSubview(blackView)
    
        toViewController.view.frame = overViewController.circleFrame
        toViewController.view.layer.cornerRadius = overViewController.circleFrame.height / 2.0
        transitionContext.containerView.addSubview(toViewController.view)
        
        let animationTiming = UICubicTimingParameters(animationCurve: .easeInOut)
        
        let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), timingParameters: animationTiming)
        
        animator.addAnimations {
            toViewController.view.frame = transitionContext.finalFrame(for: toViewController)
            toViewController.view.layer.cornerRadius = 0
            blackView.alpha = 1
        }
        
        animator.addCompletion { finished in
            blackView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        animator.startAnimation()
    }
}
