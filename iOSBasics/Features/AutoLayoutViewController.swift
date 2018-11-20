//
//  AutoLayoutViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 15/11/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

// Ref - https://stackoverflow.com/questions/26180822/how-to-add-constraints-programmatically-using-swift
// Ref - https://github.com/SnapKit/SnapKit

import Foundation
import UIKit
import SnapKit

class AutoLayoutViewController : UIViewController {
    
    // snapkit test
    lazy var box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 0. Using Snapkit
        box.backgroundColor = UIColor.red
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.top.equalTo(100)
            make.left.equalTo(self.view)
        }
        
        // 1. Using NSLayoutConstraint initializer
        addViewUsingNSLayoutConstraintInitializer1()
        addViewUsingNSLayoutConstraintInitializer2()
        addViewUsingNSLayoutConstraintInitializer3()
        
        // 2. Using Visual Format Language
        addViewUsingvisualFormatLanguage1()
        addViewUsingvisualFormatLanguage2()
        
        // 3. Using a mix of NSLayoutConstraint initializer and Visual Format Language
        addViewUsingMixOfNSLayoutContraintAndVisualFormat1()
        addViewUsingMixOfNSLayoutContraintAndVisualFormat2()
        addViewUsingMixOfNSLayoutContraintAndVisualFormat3()
        
        // 4. Using UIView.AutoresizingMask
        addViewUsingAutoresizingMask()
        
//        // 5. Using NSLayoutAnchor
//        addViewUsingNSLayoutAnchor1()
//        addViewUsingNSLayoutAnchor2()
//        addViewUsingNSLayoutAnchor3()
//
//        // 6. Using intrinsicContentSize and NSLayoutAnchor
//        addViewUsingIntrinsicContentSizeAndNSLayoutAnchor()
        
    }
    
    
    // MARK: - 1. Using NSLayoutConstraint initializer
    func addViewUsingNSLayoutConstraintInitializer1(){
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: -300)
        let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
        let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

     }
    
    func addViewUsingNSLayoutConstraintInitializer2(){
        let newView = UIView()
        newView.backgroundColor = UIColor.orange
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: -300)
        let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

    }
    
    func addViewUsingNSLayoutConstraintInitializer3(){
    
        let newView = UIView()
        newView.backgroundColor = UIColor.yellow
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: -300).isActive = true
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50).isActive = true
    }
    
    
    // MARK: - 2. Using Visual Format Language
    func addViewUsingvisualFormatLanguage1(){
        let newView = UIView()
        newView.backgroundColor = UIColor.blue
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let views = ["view": view!, "newView": newView]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[view]-(<=0)-[newView(200)]", options: NSLayoutConstraint.FormatOptions.alignAllCenterY, metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-(<=0)-[newView(200)]", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: views)
        view.addConstraints(horizontalConstraints)
        view.addConstraints(verticalConstraints)
    }
    
    func addViewUsingvisualFormatLanguage2(){
        let newView = UIView()
        newView.backgroundColor = UIColor.lightGray
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let views = ["view": view!, "newView": newView]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[view]-(<=0)-[newView(100)]", options: NSLayoutConstraint.FormatOptions.alignAllCenterY, metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-(<=0)-[newView(100)]", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: views)
        NSLayoutConstraint.activate(horizontalConstraints)
        NSLayoutConstraint.activate(verticalConstraints)
    }
    
    
    // MARK: - 3. Using a mix of NSLayoutConstraint initializer and Visual Format Language
    func addViewUsingMixOfNSLayoutContraintAndVisualFormat1(){
        let newView = UIView()
        newView.backgroundColor = UIColor.darkGray
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let views = ["newView": newView]
        let widthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[newView(200)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[newView(200)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 200)
        view.addConstraints(widthConstraints)
        view.addConstraints(heightConstraints)
        view.addConstraints([horizontalConstraint, verticalConstraint])
    }
    
    func addViewUsingMixOfNSLayoutContraintAndVisualFormat2(){
        let newView = UIView()
        newView.backgroundColor = UIColor.gray
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let views = ["newView": newView]
        let widthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[newView(100)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[newView(100)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 200)
        NSLayoutConstraint.activate(widthConstraints)
        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
    
    func addViewUsingMixOfNSLayoutContraintAndVisualFormat3(){
        let newView = UIView()
        newView.backgroundColor = UIColor.lightGray
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let views = ["newView": newView]
        let widthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[newView(50)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[newView(50)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        NSLayoutConstraint.activate(widthConstraints)
        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 200).isActive = true
    }
    
    
    // MARK: - 4. Using UIView.AutoresizingMask
    func addViewUsingAutoresizingMask(){
        let newView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        newView.backgroundColor = UIColor.brown
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = true
        newView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY + 400)
        newView.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
    }
    
    // MARK: - 5. Using NSLayoutAnchor
    func addViewUsingNSLayoutAnchor1(){
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = newView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = newView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint = newView.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = newView.heightAnchor.constraint(equalToConstant: 100)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func addViewUsingNSLayoutAnchor2(){
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = newView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = newView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint = newView.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = newView.heightAnchor.constraint(equalToConstant: 100)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func addViewUsingNSLayoutAnchor3(){
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 100).isActive = true

    }
    
    // MARK: - 6. Using intrinsicContentSize and NSLayoutAnchor
    func addViewUsingIntrinsicContentSizeAndNSLayoutAnchor(){
        let newView = CustomView()
        newView.backgroundColor = UIColor.red
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = newView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = newView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
}
class CustomView: UIView {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}

