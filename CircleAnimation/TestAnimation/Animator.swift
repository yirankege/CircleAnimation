//
//  Animator.swift
//  TestAnimation
//
//  Created by xjk on 27/10/2017.
//  Copyright © 2017 xjk. All rights reserved.
//

import UIKit

class AnimatorPush: NSObject,UIViewControllerAnimatedTransitioning,CAAnimationDelegate {
    
    var transitionContext:UIViewControllerContextTransitioning?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //记录 transitioncontext
        self.transitionContext = transitionContext;
        //得到Vc object
        let toVC:BBViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! BBViewController
        let fromVC:AAViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! AAViewController
        //吧ToView添加到COntainer上面
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        
        let button = fromVC.clickButton
        //ovalIn绘制椭圆路径，
        let circlePathInitial = UIBezierPath(ovalIn: (button?.frame)!)
        
        //计算最后的大小
        let radius = toVC.view.bounds.height
        //动画增长路径，负数表增大，正数为减小，这个不懂的可以查查
        let circlePathFinal = UIBezierPath(ovalIn: (button?.frame.insetBy(dx:-radius, dy:-radius))!)

        //创建 shapeayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePathFinal.cgPath
        toVC.view.layer.mask = shapeLayer
        
        //创建动画然后添加
        let maskAnimation = CABasicAnimation(keyPath: "path")
        maskAnimation.fromValue = circlePathInitial.cgPath
        maskAnimation.toValue = circlePathFinal.cgPath
        maskAnimation.duration = self.transitionDuration(using: transitionContext)
        maskAnimation.delegate = (self as CAAnimationDelegate)
        shapeLayer.add(maskAnimation, forKey: "path")
        
        
    }
    
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.transitionContext?.completeTransition(!(self.transitionContext?.transitionWasCancelled)!)
        
        self.transitionContext?.viewController(forKey: UITransitionContextViewControllerKey.from)?.view.layer.mask = nil

        
    }
    
   
    
}


class AnimatorPop: NSObject,UIViewControllerAnimatedTransitioning,CAAnimationDelegate {
    var transitionContext:UIViewControllerContextTransitioning?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //record transitioncontext
        self.transitionContext = transitionContext;
        //get vc model
        let fromVC:BBViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! BBViewController
        let toVC:AAViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! AAViewController
        // add tovc.view to containerView
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        
        let button = toVC.clickButton
        
        let circlePathInitial = UIBezierPath(ovalIn: (button?.frame)!)
        //just big enough is OK, too. Because here we just need to make sure the mask can cover all view
        let radius = toVC.view.bounds.height
        let circlePathFinal = UIBezierPath(ovalIn: (button?.frame.insetBy(dx:-radius, dy:-radius))!)
        
        //create shape layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePathFinal.cgPath
        toVC.view.layer.mask = shapeLayer
        
        //create animation and add it
        let maskAnimation = CABasicAnimation(keyPath: "path")
        maskAnimation.toValue = circlePathInitial.cgPath
        maskAnimation.fromValue = circlePathFinal.cgPath
        maskAnimation.duration = self.transitionDuration(using: transitionContext)
        maskAnimation.delegate = (self as CAAnimationDelegate)
        shapeLayer.add(maskAnimation, forKey: "path")

    }
    
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.transitionContext?.completeTransition(!(self.transitionContext?.transitionWasCancelled)!)
        
        self.transitionContext?.viewController(forKey: UITransitionContextViewControllerKey.from)?.view.layer.mask = nil
        
        
    }
}





