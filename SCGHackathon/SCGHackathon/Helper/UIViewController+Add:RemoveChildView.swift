//
//  UIViewController+Add:RemoveChildView.swift
//  SCGHackathon
//
//  Created by Hoang Hiep Ho on 10/27/18.
//  Copyright © 2018 Gamedex. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // add child view Controller
    func add(asChildViewController viewController: UIViewController, segmentControlView segmentControlView: UIView) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        
        segmentControlView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = segmentControlView.bounds
        //   viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    
}

