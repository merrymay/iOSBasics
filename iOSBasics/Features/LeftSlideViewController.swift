//
//  LeftSlideViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 20/12/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

/*
 
 Show Left Menu
 STEP 0 - Present viewcontroller as as modal with overcurrentcontext style!
 STEP 1 - Set a view's hidden value to true in LeftMenuViewController's loadView
 STEP 2 - Add left-move-in transition animation to a view in viewDidAppear
 
 Close Left Menu
 STEP 1 - Animate a view's frame by using UIView's animation
 STEP 2 - Dismiss ViewController when the animation finished
 
*/
class LeftSlideViewController : UIViewController {
    
    override func loadView() {
        super.loadView()
        
        self.view.isHidden = true
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.isHidden = false
        
        let transition = CATransition.init()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction.init(name: .easeInEaseOut)
        transition.type = .moveIn
        transition.subtype = .fromLeft
        
        self.view.layer.add(transition, forKey: nil)
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.view.frame = CGRect(x: self.view.frame.width * -1, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }) { (finished) in
            self.view.isHidden = true
            self.dismiss(animated: false, completion: nil)
        }
    }
}
