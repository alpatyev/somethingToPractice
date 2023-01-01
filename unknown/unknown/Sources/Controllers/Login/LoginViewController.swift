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
    
    private lazy var loginPlace: UITextField = {
        let textField = UITextField()
        textField.setupAppearance(placeholder: "name")
        return textField
    }()
    
    private lazy var passwordPlace: UITextField = {
        let textField = UITextField()
        textField.setupAppearance(placeholder: "password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setupAppearance(text: "Login")
        button.layer.cornerRadius *= 2
        button.titleLabel?.font = Constants.Fonts.headers
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
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
        view.addSubview(loginPlace)
        view.addSubview(passwordPlace)
        view.addSubview(loginButton)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
    }

    // MARK: - Setup top layout
    
    private func setupLayout() {
        loginPlace.snp.makeConstraints { make in
            make.left.equalTo(view).offset(Constants.Layout.elementHeight)
            make.right.equalTo(view).inset(Constants.Layout.elementHeight)
            make.height.equalTo(Constants.Layout.elementHeight * 1.5)
            make.bottom.equalTo(view.snp.centerY).multipliedBy(0.5)
        }
        
        passwordPlace.snp.makeConstraints { make in
            make.left.equalTo(view).offset(Constants.Layout.elementHeight)
            make.right.equalTo(view).inset(Constants.Layout.elementHeight)
            make.height.equalTo(Constants.Layout.elementHeight * 1.5)
            make.top.equalTo(loginPlace.snp.bottom).offset(Constants.Layout.elementHeight)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordPlace.snp.bottom).offset(Constants.Layout.elementHeight)
            make.left.equalTo(view).offset(Constants.Layout.elementHeight)
            make.right.equalTo(view).inset(Constants.Layout.elementHeight)
            make.height.equalTo(Constants.Layout.elementHeight * 2)
        }
        
        signInButton.snp.makeConstraints { make in
            make.left.equalTo(view).offset(Constants.Layout.elementHeight)
            make.right.equalTo(view.snp.centerX).multipliedBy(0.9)
            make.height.equalTo(Constants.Layout.elementHeight)
            make.bottom.equalTo(view).inset(Constants.Layout.elementWidth)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.centerX).dividedBy(0.9)
            make.right.equalTo(view).inset(Constants.Layout.elementHeight)
            make.height.equalTo(Constants.Layout.elementHeight)
            make.bottom.equalTo(view).inset(Constants.Layout.elementWidth)
        }
    }
    
    // MARK: - Actions
    
    @objc private func loginTapped() {
        print("LOG IN: -> open base tabbar")
        let tabBarViewController = BaseTabBarViewController()
        present(tabBarViewController, animated: true, completion: nil)
    }
    
    @objc private func signInTapped() {
        print("SIGN IN: -> present alert?")
        showAlert(message: "sign in is temporary unavailable")
        
    }
    
    @objc private func signUpTapped() {
        print("SIGN UP: -> present alert?")
        showAlert(message: "sign up is temporary unavailable")
    }
    
    private func showAlert(title: String? = nil, message: String) {
        let alert = UIAlertController(title: title ?? " Network error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.view.tintColor = Constants.Colors.accentColor
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

