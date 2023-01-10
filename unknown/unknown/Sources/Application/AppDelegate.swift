//
//  AppDelegate.swift
//  unknown
//
//  Created by Nikita Alpatiev on 12/27/22.
//

import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // temporary checks
        let result = DataSource()
        if result.successful {
            print(">> Recieved <\(DataSource.cells.count)> cells:")
            DataSource.cells.forEach { print(" - \($0.title)")}
            print("")
        } else {
            print("ERROR: ITEMS NOT LOADED")
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

