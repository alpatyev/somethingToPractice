//
//  BaseTabBarViewController.swift
//  unknown
//
//  Created by Nikita Alpatiev on 12/28/22.
//

import UIKit

class BaseTabBarViewController: UITabBarController {
    
    // MARK: Controllers
    
    private lazy var searchViewController: UIViewController = {
        SearchViewController()
    }()
    
    private lazy var listViewController: UIViewController =  {
        ListViewController()
    }()
    
    private lazy var scrollViewController: UIViewController =  {
        ScrollViewController()
    }()
    
    private lazy var setttingsViewController: UIViewController =  {
        SettingsViewController()
    }()
    
    // MARK: - Tabbar items
    
    enum PrefferedItems {
        static var search: UITabBarItem = {
            let item = UITabBarItem(tabBarSystemItem: .search, tag: 0)
            item.title = "search"
            return item
        }()
        
        static var list: UITabBarItem = {
            let item = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)
            item.title = "list"
            return item
        }()
        
        static var featured: UITabBarItem = {
            let item = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
            item.title = "features"
            return item
        }()
        
        static var settings: UITabBarItem = {
            let item = UITabBarItem(tabBarSystemItem: .more, tag: 3)
            item.title = "settings"
            return item
        }()
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setControllers()
    }
    
    // MARK: - Setups
    
    private func setupAppearance() {
        modalPresentationStyle = .fullScreen
        tabBar.backgroundColor = .clear
        tabBar.unselectedItemTintColor = .black
        tabBar.tintColor = .white
    }
    
    private func setControllers() {
        searchViewController.tabBarItem = PrefferedItems.search
        listViewController.tabBarItem = PrefferedItems.list
        scrollViewController.tabBarItem = PrefferedItems.featured
        setttingsViewController.tabBarItem = PrefferedItems.settings
        
        self.setViewControllers([searchViewController, listViewController,
                                 scrollViewController, setttingsViewController], animated: true)
    }
}
