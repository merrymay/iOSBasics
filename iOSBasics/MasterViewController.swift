//
//  MasterViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 14/11/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

import UIKit

enum SampleDataTypes {
    case autolayout, network, webview, autofill, restAPI, banner, etc
}
struct SampleData {
    var sampleDataType : SampleDataTypes
    var title : String
}

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    //var objects = [Any]()
    var objects : [Any] = [
        SampleData(sampleDataType: .autolayout, title: "Autolayout"),
        SampleData(sampleDataType: .network, title: "Network"),
        SampleData(sampleDataType: .webview, title: "WebView"),
        SampleData(sampleDataType: .autofill, title: "Username, password autofill"),
        
        SampleData(sampleDataType: .restAPI, title: "RestAPI"),
        SampleData(sampleDataType: .banner, title: "Self-scrolling Banner"),
        
        SampleData(sampleDataType: .webview, title: "firebase FCM"),
        SampleData(sampleDataType: .webview, title: "Async image load"), 
        SampleData(sampleDataType: .restAPI, title: "etc")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                //let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                //controller.detailItem = object
                if let date = objects[indexPath.row] as? NSDate {
                    controller.detailItem = date
                } else if let sampleData = objects[indexPath.row] as? SampleData {
                    controller.detailItem = sampleData
                }
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        if let date = objects[indexPath.row] as? NSDate {
            cell.textLabel!.text = date.description
        } else if let sampleData = objects[indexPath.row] as? SampleData {
            cell.textLabel!.text = sampleData.title
        }
//        let object = objects[indexPath.row] as! NSDate
//        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}

