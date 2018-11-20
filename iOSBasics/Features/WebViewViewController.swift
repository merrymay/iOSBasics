//
//  WebViewViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 14/11/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewViewController : UIViewController, WKUIDelegate {

    var webView: WKWebView!
 
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
         
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    
    
    // TODO - local webpage load, js interface, policy
}
