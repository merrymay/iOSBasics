//
//  DetailViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 14/11/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

// Ref - https://developer.apple.com/documentation/webkit/wkwebview

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                if let sampleData = detail as? SampleData {
                    label.text = sampleData.title
                    loadNextViewController(sampleData: sampleData)
                } else if let date = detail as? NSDate {
                    label.text = date.description
                }
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: Any? {
        didSet {
            // Update the view.
            configureView()
        }
    }


    func loadNextViewController(sampleData:SampleData){
        switch sampleData.sampleDataType {
        case .autolayout :
                if let vc = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "AutoLayout") as? AutoLayoutViewController {
                    self.navigationController?.pushViewController(vc, animated: false)
            }
        case .network :
            if let vc = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "Network") as? NetworkViewController {
                self.navigationController?.pushViewController(vc, animated: false)
            }
        case .webview :
                print("go WebViewViewController")
                if let vc = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "WebView") as? WebViewViewController {
                    //self.navigationController?.pushViewController(vc, animated: false)
                    
                    self.present(vc, animated: false) {
                        
                    }
                }
        case .autofill :
                print("go autofill ")
                if let vc = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "AutoFill") as? PasswordAutoFillViewController {
                    self.navigationController?.pushViewController(vc, animated: false)
//                    self.present(vc, animated: false) {
//
//                    }
            }
        case .banner :
            if let vc = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "Banner") as? BannerViewController {
                self.navigationController?.pushViewController(vc, animated: false)
            }
            
 
        case .dropdown :
            if let vc = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "Dropdown") as? DropdownViewController {
                self.navigationController?.pushViewController(vc, animated: false)
            }
        case .popover :
            if let vc = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "PopOverMain") as? PopoverMainViewController {
                self.navigationController?.pushViewController(vc, animated: false)
            }
        case .leftMenu :
            if let vc = UIStoryboard(name: "Features", bundle: nil).instantiateViewController(withIdentifier: "PopOverMain") as? PopoverMainViewController {
                self.navigationController?.pushViewController(vc, animated: false)
            }
        default:

        print("")
    }
    }
}

