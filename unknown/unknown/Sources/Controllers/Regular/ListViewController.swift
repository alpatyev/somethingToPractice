//
//  ListViewController.swift
//  unknown
//
//  Created by Nikita Alpatiev on 12/28/22.
//

import UIKit

final class ListViewController: UIViewController, UITextFieldDelegate {

    // MARK: - UI
    // TODO: - Fix console errors after interacting with textfields
    
    private var headerTextField: UITextField = {
        let textField = UITextField()
        textField.smartDashesType = .no
        textField.autocorrectionType = .no
        textField.keyboardType = .webSearch
        textField.returnKeyType = .search
        textField.setupAppearance(placeholder: "search")
        return textField
    }()
        
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup ViewController
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        headerTextField.resignFirstResponder()
    }
    
    private func setupView() {
        view.backgroundColor = .black
        headerTextField.delegate = self
    }
    
    private func setupHierarchy() {
        view.addSubview(headerTextField)
    }
    
    // MARK: - Setup layout
    
    private func setupLayout() {
        headerTextField.snp.makeConstraints { make in
            make.top.equalTo(view).inset(Constants.Layout.elementHeight)
            make.left.equalTo(view).offset(Constants.Layout.elementHeight)
            make.right.equalTo(view).inset(Constants.Layout.elementHeight)
            make.height.equalTo(Constants.Layout.elementHeight * 1.5)
        }
    }
    
    // MARK: - Actions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text ?? "no text")
        headerTextField.resignFirstResponder()
        return true
    }
}

