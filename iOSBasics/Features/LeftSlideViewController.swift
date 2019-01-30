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

class LeftSlideViewController : UIViewController {
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // defined in storyboard
        // username.textContentType = .username
        // password.textContentType = .password
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let animation = CATransition()
            animation.duration = 2.5
            animation.type = CATransitionType.moveIn
            animation.subtype = CATransitionSubtype.fromLeft
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            self.view.layer.add(animation, forKey: "SwitchToView")
        }
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        //self.dismissDetail()
        
        let animation = CATransition()
        animation.duration = 2.5
        animation.type = CATransitionType.moveIn
        animation.subtype = CATransitionSubtype.fromRight
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.view.layer.add(animation, forKey: "SwitchToView")
        
        self .dismiss(animated: false) {
            
        }
    }
}
extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 1.25
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 1.25
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
}
