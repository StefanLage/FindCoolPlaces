//
//  AppDelegate.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 24/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window                     = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor    = UIColor.white
        let rootViewController = PlacesViewController()
        rootViewController.viewModel = PlacesViewModel()
        self.navigationController       = UINavigationController(rootViewController: rootViewController)
        self.window!.rootViewController = self.navigationController
        self.window!.makeKeyAndVisible()
        return true
    }
}

