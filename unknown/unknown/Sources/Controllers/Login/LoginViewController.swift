//
//  LoginViewController.swift
//  unknown
//
//  Created by Nikita Alpatiev on 12/27/22.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setupAppearance(text: "Login")
        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setupAppearance(text: "Sign in")
        button.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setupAppearance(text: "Sign up")
        button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        return button
    }()

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
    
    func setupView() {
        view.backgroundColor = Constants.Colors.background
    }
    
    // MARK: - Setup hierarchy
    
    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
    }

    // MARK: - Setup top layout
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(Constants.Layout.elementWidth * 2)
            make.height.equalTo(Constants.Layout.elementHeight * 2)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).multipliedBy(0.5)
        }
        
        signInButton.snp.makeConstraints { make in
            make.left.equalTo(view).offset(Constants.Layout.elementHeight)
            make.right.equalTo(view.snp.centerX).multipliedBy(0.9)
            make.height.equalTo(Constants.Layout.elementHeight)
            make.bottom.equalTo(view).inset(Constants.Layout.elementWidth * 2)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.centerX).dividedBy(0.9)
            make.right.equalTo(view).inset(Constants.Layout.elementHeight)
            make.height.equalTo(Constants.Layout.elementHeight)
            make.bottom.equalTo(view).inset(Constants.Layout.elementWidth * 2)
        }
    }
    
    // MARK: - Actions
    
    @objc private func signInTapped() {
        print("SIGN IN: -> present next vc")
        let tabBarViewController = BaseTabBarViewController()
        present(tabBarViewController, animated: true, completion: nil)
    }
    
    @objc private func signUpTapped() {
        print("SIGN UP: -> present next vc")
    }
}

