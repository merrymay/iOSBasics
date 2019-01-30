//
//  DropdownViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 30/01/2019.
//  Copyright © 2019 MayPark. All rights reserved.
//

import Foundation
import UIKit

class DropdownViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var arrTitles = [String]()
    
    override func loadView() {
        super.loadView()
        tableView.isHidden = true
        tableView.rowHeight = 40.0
        
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 1.0
        
        arrTitles = ["London", "Newyork", "Paris", "LA"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // table view frame
        DispatchQueue.main.async {
//            let frame = self.tableView.frame;
//            frame.height = self.tableView.contentSize.height
//            self.tableView.frame = frame
            
        }
    }
    @IBAction func selectButtonAction(_ sender: Any) {
        self.selectButton.isSelected = !self.selectButton.isSelected
        self.tableView.isHidden =  ( self.selectButton.isSelected ? false : true )
    }
}

extension DropdownViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! UITableViewCell
        cell.textLabel?.text = self.arrTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectButton.setTitle(self.arrTitles[indexPath.row], for: .normal)
    }
}
