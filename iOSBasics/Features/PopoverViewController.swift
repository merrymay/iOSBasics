//
//  PopoverViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 11/02/2019.
//  Copyright © 2019 MayPark. All rights reserved.
//

import Foundation

import UIKit

class PopoverViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.black
//        view.superview?.backgroundColor = UIColor.black
//        view.superview?.layer.cornerRadius = 5
    }
    
    //Updating the popover size
    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: label.frame.size.width, height: label.frame.size.height + 32)
        }
        set {
            super.preferredContentSize = newValue
        }
    }

//
//    override func viewDidAppear(_ animated: Bool) {
//        view.backgroundColor = UIColor.black
//        view.superview?.backgroundColor = UIColor.black
//        view.superview?.layer.cornerRadius = 5
//        super.viewDidAppear(false)
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(false)
//    }
//
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        view.backgroundColor = UIColor.black
//        view.superview?.backgroundColor = UIColor.black
//        view.superview?.layer.cornerRadius = 5
//        super.viewWillTransition(to: size, with: coordinator)
//    }

}
