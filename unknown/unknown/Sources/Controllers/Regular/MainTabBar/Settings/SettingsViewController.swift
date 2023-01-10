//
//  SettingsViewController.swift
//  unknown
//
//  Created by Nikita Alpatiev on 12/28/22.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: - UI
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup view
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    // MARK: - Setup hierarchy
    
    private func setupHierarchy() {}
    
    // MARK: - Setup layout
    
    private func setupLayout() {}
    
    // MARK: - Actions

}

