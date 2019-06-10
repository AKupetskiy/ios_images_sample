//
//  AppDelegate.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/8/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        PhotosListDefaultRouter().presentModule(on: navController)

        return true
    }
}

