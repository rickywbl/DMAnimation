//
//  DMTransitionAnimator.swift
//  格瓦拉启动页
//
//  Created by DoubleMint on 2018/1/23.
//  Copyright © 2018年 王保霖. All rights reserved.
//

import UIKit

class DMTransitionAnimator: NSObject , UIViewControllerAnimatedTransitioning ,CAAnimationDelegate{
    
    weak var transitionContext : UIViewControllerContextTransitioning?
    var  transformType: Int = 0

    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    override init() {
        super.init()
    }

    init(transformType: Int) {
        super.init()
        self.transformType = transformType
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        self.transitionContext = transitionContext
        let containerView = transitionContext.containerView
  
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
        
        let button = fromVC.popButton!
        containerView .addSubview(toVC.view)
       
        let circleMaskPathInitial = UIBezierPath(ovalIn: button.frame)
        let extremePoint = CGPoint(x: button.center.x, y: button.center.y - toVC.view.frame.height)
        let radius = sqrt((extremePoint.x * extremePoint.x) + (extremePoint.y * extremePoint.y))
        let circleMaskPathFinal = UIBezierPath(ovalIn: button.frame.insetBy(dx: -radius, dy: -radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.cgPath
        toVC.view.layer.mask = maskLayer
        
        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.cgPath
        maskLayerAnimation.toValue = circleMaskPathFinal.cgPath
        maskLayerAnimation.duration = self.transitionDuration(using: transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.add(maskLayerAnimation, forKey: "path")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.transitionContext?.completeTransition(!(self.transitionContext?.transitionWasCancelled)!)
        self.transitionContext?.viewController(forKey: UITransitionContextViewControllerKey.from)?.view.layer.mask = nil
    }
    


}
