//
//  PasswordAutoFillViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 25/11/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

import Foundation
import UIKit

// Ref. https://medium.com/@abhimuralidharan/password-autofill-for-ios-apps-for-faster-login-ios-11-1d9f77deb35a
class PasswordAutoFillViewController : UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // defined in storyboard
        // username.textContentType = .username
        // password.textContentType = .password
    }
    
    // Xcode 세팅에서 associaated domain 설정
    // 서버의 well-known folder 에 aasa file 추가
    // {
    //  "webcredentials" :{ "apps" : ["teamID.appBundleId"] }
    // }
//    In Xcode project settings → Capabilites →Associated Domains, add your website domain. The domain name should be prefixed with the keyword webcredentials: because we are using the webcredentials service and this is important. Example: webcredentials:facebook.com

//    This is all what we need to do to tell iOS that the app is associated to a website. Now we need the website to agree and point back to the app so that the iOS can establish a two way connection.
//    Have a look at my other article on Universal Links in iOS which explains about how to setup AASA file. I am not explaining it here. Just note that universal links uses applinks: prefix instead of webcredentials: prefix for using shared web credentials.


}
