//
//  PopoverViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 11/02/2019.
//  Copyright © 2019 MayPark. All rights reserved.
//
// Ref. https://stackoverflow.com/questions/45285320/popover-presentation-style-on-iphone-devices-possible-any-more

import Foundation
import UIKit
import AMPopTip

class PopoverMainViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    // show bublle message view using popover
    // - it doesn't work below iOS9
    @IBAction func showPopover(_ sender: UIButton) {
        
        // get a reference to the view controller for the popover
        let popController = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "PopOver")

        // set the presentation style
        popController.modalPresentationStyle = UIModalPresentationStyle.popover

        // set up the popover presentation controller
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = sender // button
        popController.popoverPresentationController?.sourceRect = sender.bounds

        // present the popover
        self.present(popController, animated: true) {
            popController.popoverPresentationController?.backgroundColor = UIColor.black
            popController.view.superview?.backgroundColor = UIColor.black
            popController.view.superview?.layer.cornerRadius = 5

        }
    }
    
    // UIPopoverPresentationControllerDelegate method
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    // show Bublle popup message using AMPopTip
    @IBAction func showAMPopTip(_ sender: UIButton) {
    
        let popTip = PopTip()
        
        popTip.textColor = UIColor.white
        popTip.textAlignment = .left
        popTip.bubbleColor = UIColor.black
        popTip.cornerRadius = 5.0
        popTip.padding = 16
        popTip.arrowSize = CGSize(width: 20, height: 10)
        popTip.edgeMargin = 16.0
        popTip.animationIn = 0
        popTip.animationOut = 0
        popTip.show(text: "메시지 ~~ ", direction: .down, maxWidth: self.view.frame.width - 64, in: self.view, from: sender.frame)
     }
    
    
    // left slide in menu
    @IBAction func leftMenuButtonAction(_ sender: Any) {
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeftSlideViewController") as? LeftSlideViewController {
             vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    
}
