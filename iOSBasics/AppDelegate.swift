//
//  AppDelegate.swift
//  iOSBasics
//
//  Created by kyoung hee park on 14/11/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

import UIKit
import CocoaLumberjack



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    var str: String?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // *** Initialize logger using CocoaLumberjack ***
        // set a different log level for each logger
        //        DDLog.add(DDOSLogger.sharedInstance, with: DDLogLevel.info)
        //        DDLog.add(DDFileLogger.sharedInstance, with: DDLogLevel.debug)
        
        
        // CocoaLumberjack - add system logger
        DDLog.add(DDOSLogger.sharedInstance)
        
        // CocoaLumberjack - add file logger
        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
        
        
        
        // Override point for customization after application launch.
        let splitViewController = window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        
        let configuration : URLSessionConfiguration =
            URLSessionConfiguration.default
//        configuration.TLSMinimumSupportedProtocol = kSSLProtocol3
//        let mySession = NSURLSession(configuration: configuration, delegate: self,
//                                     delegateQueue: operationQueue)
        
        configuration.tlsMinimumSupportedProtocol = .tlsProtocol12
        configuration.tlsMaximumSupportedProtocol = .tlsProtocol13
        DDLogDebug("tlsMaximumSupportedProtocol = \(configuration.tlsMaximumSupportedProtocol.rawValue)")
        DDLogDebug("tlsMinimumSupportedProtocol = \(configuration.tlsMinimumSupportedProtocol.rawValue)")

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        var testToMergeByMergeTool: String = "Hello"
        
        var testToResetCommit: String = "reset commit2"
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

