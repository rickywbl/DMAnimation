//
//  DMNavigationDelegate.swift
//  格瓦拉启动页
//
//  Created by DoubleMint on 2018/1/23.
//  Copyright © 2018年 王保霖. All rights reserved.
//

import UIKit

class DMNavigationDelegate: NSObject , UINavigationControllerDelegate {
    
    @IBOutlet weak var navigationController: UINavigationController!
    var interactionController: UIPercentDrivenInteractiveTransition?
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if(operation == .push){
            return DMTransitionAnimator(transformType: 1)
        }else{
            return DMTransitionAnimator(transformType: 0)
        }
    }
    
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactionController
    }
}
