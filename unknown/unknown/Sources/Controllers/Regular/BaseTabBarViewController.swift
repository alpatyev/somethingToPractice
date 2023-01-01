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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupItems()
    }
    
    // MARK: - Setups
    
    private func setupAppearance() {
        modalPresentationStyle = .fullScreen
        tabBar.backgroundColor = .clear
        tabBar.unselectedItemTintColor = Constants.Colors.background
        tabBar.tintColor = Constants.Colors.accentColor
        
        tabBar.layer.cornerRadius = 25 // half of tabBar height
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMaxXMinYCorner,
                                      .layerMinXMinYCorner,
                                      .layerMaxXMaxYCorner,
                                      .layerMinXMaxYCorner]
    }
    
    private func setupItems() {
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        listViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)
        scrollViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
        setttingsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
        
        setViewControllers([searchViewController,
                            listViewController,
                            scrollViewController,
                            setttingsViewController],animated: true)
    }
}

