//
//  AppDelegate.swift
//  SpareChange
//
//  Created by Charlene Angeles on 10/24/17.
//  Copyright © 2017 deHao. All rights reserved.
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        // Override point for customization after application launch.
        return true
    }

}

