//
//  AppDelegate.swift
//  Money Zap
//
//  Created by Divij Satija on 19/04/16.
//  Copyright © 2016 Divij Satija. All rights reserved.
//

import UIKit
import GameKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, KiipDelegate {

    var window: UIWindow?

    let KP_APP_KEY: String = "7a8a045268e07b41eb452014432c3adc"
    let KP_APP_SECRET: String = "09a092a96edd1ab19c2d5b3fc16ef26b"

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        var kiip: Kiip = Kiip(appKey: KP_APP_KEY, andSecret: KP_APP_SECRET)
        kiip.delegate = self
        Kiip.setSharedInstance(kiip)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    

}



