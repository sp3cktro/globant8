
import UIKit

final class PulseScaleAnimation {
    private let view: UIView
    
    init(forView view: UIView) {
        self.view = view
    }
    
    func animatePulse() {
        self.view.layer.removeAllAnimations()
        self.view.layer.sublayers?.removeAll()
        
        for index in 0...2 {
            let layer = self.createCircle()
            let opacityPulse = self.opacityPulse(withDelay: CGFloat(index+1) * 0.2)
            let scalePulse = self.scalePulse(withDelay: CGFloat(index+1) * 0.2)
            
            self.view.layer.addSublayer(layer)
            layer.add(opacityPulse, forKey: AnimationKey.opacity.rawValue)
            layer.add(scalePulse, forKey: AnimationKey.scale.rawValue) 
        }
    }
    
    private func createCircle() -> CAShapeLayer {
        let circularPath = UIBezierPath(arcCenter: .zero, radius: UIScreen.main.bounds.size.width / CGFloat(NumberF.half.rawValue), startAngle: CGFloat(NumberF.zero.rawValue) , endAngle: CGFloat(NumberF.half.rawValue * .pi) , clockwise: true)
        let pulseLayer = CAShapeLayer()
        pulseLayer.path = circularPath.cgPath
        pulseLayer.lineWidth = CGFloat(NumberF.half.rawValue)
        pulseLayer.fillColor = UIColor.clear.cgColor
        pulseLayer.strokeColor = UIColor.white.cgColor
        pulseLayer.lineCap = CAShapeLayerLineCap.round
        pulseLayer.position = CGPoint(x: view.bounds.width, y: 0)
        
        return pulseLayer
    }
    
    private func scalePulse(withDelay delay: CGFloat = 0) -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: AnimationKey.transform.rawValue)
        scaleAnimation.beginTime = CFTimeInterval(delay)
        scaleAnimation.duration = CFTimeInterval(NumberF.duration.rawValue)
        scaleAnimation.fromValue = NumberF.zero.rawValue
        scaleAnimation.toValue = NumberF.toValue.rawValue
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        scaleAnimation.repeatCount = .greatestFiniteMagnitude
        
        return scaleAnimation
    }
    
    private func opacityPulse(withDelay delay: CGFloat = 0) -> CABasicAnimation {
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.beginTime = CFTimeInterval(delay)
        opacityAnimation.duration = CFTimeInterval(NumberF.duration.rawValue)
        opacityAnimation.fromValue = NumberF.toValue.rawValue
        opacityAnimation.toValue = NumberF.zero.rawValue
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        opacityAnimation.repeatCount = .greatestFiniteMagnitude
        
        return opacityAnimation
    }
}
