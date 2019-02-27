//
//  WebViewViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 14/11/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//


// https://medium.freecodecamp.org/how-to-build-cross-origin-communication-bridges-in-ios-and-andriod-7baef82b3f02
//⚠️ Important Note Regarding iOS ⚠️
//When you get to the point that you want to destroy your WKWebView, it is imperative that you remove your script message handler. If you do not do so, the script message handler will still hold a reference to your WKWebView and memory leaks will ensue upon creating new WKWebViews.

import Foundation
import UIKit
import WebKit


class WebViewViewController : UIViewController, WKNavigationDelegate {

    
    var webView: WKWebView!
    var button: UIButton = UIButton(type: UIButton.ButtonType.system)
    
    
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func loadView() {
        
        let contentController = WKUserContentController()
        let webConfiguration = WKWebViewConfiguration()

        // add view
        // create webview programmatically to use WKWebViewConfiguration
        
        // JS 처리용
        // native => js
        // HTML 문서 로드시 JS 함수 호출하기
        let userScript = WKUserScript(source: "redHeader()", injectionTime: .atDocumentStart, forMainFrameOnly: true)
        contentController.addUserScript(userScript)
        
        // js => native
        // - webkit.messageHandlers.Name.postMessage("") 와 연동.
        // - userContentController didReceive 에서 처리함
        // - ex. webkit.messageHandlers.callbackHandler.postMessage("MessageBody");
        contentController.add(self, name: "callbackHandler")
        
        webConfiguration.userContentController = contentController
        
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        view = webView
        webView.backgroundColor = UIColor.clear
        
        // add button
        view.addSubview(button)
        button.setTitle("Native Button to call js on webview", for: .normal)
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(250)
            make.top.equalTo(400)
            make.left.equalTo(view)
        }
        
        button.addTarget(self, action:  #selector(buttonTapAction(sender:)), for: .touchUpInside)
        
        
        

        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let myURL = URL(string: "https://merrymay.github.io/may.github.io/index.html")
        //let myURL = URL(string: "https://familybox-dev.kt.com/ktFamily-s2/v3/story/view/detail?os=ios&ve=4.0.0&si=00EDS3V6JYN&ak=&cn=&tv=")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    // MARK: - User actoins
    @objc func buttonTapAction(sender: UIButton){
        // native 에서 일반적으로 JS 함수 호출하기
        print("button tapped")
        
        webView.evaluateJavaScript("jsCalledFromNative()") { (result, error) in
            if let result = result {
                print(result)
            }
        }
    }

    // MARK: -
    func abc(){
        print("*** Native call from webview's js ***")
    }
 
    // TODO - local webpage load, js interface, policy
}

// MARK: - WKScriptMessageHandler
extension WebViewViewController : WKScriptMessageHandler {
    // *** JS => Native call
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("userContentController>> didReceive ")
        if message.name == "callbackHandler" {
            print("***JS callback handler body = \(message.body)")
            abc()
            //            if message.body as! String == "abc" {
            //                abc()
            //            }
        }
    }
}


// MARK: - WKUIDelegate
extension WebViewViewController : WKUIDelegate {
    
    @available(iOS 8.0, *)
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let otherAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("ok  button action")
            completionHandler()
        }
        alert.addAction(otherAction)
        self.present(alert, animated: true, completion: nil)
        
    }
}
