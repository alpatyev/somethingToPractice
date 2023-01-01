//
//  ListViewController.swift
//  unknown
//
//  Created by Nikita Alpatiev on 12/28/22.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // MARK: - Helpers
    
    private lazy var names = ["element",
                              "at",
                              "indexPath.row",
                              "shows",
                              "here"]
        
    private var searchedResults: [String] {
        if let text = headerTextField.text {
            let filtered = names.compactMap { line in
                line.contains(text) ? line : nil
            }
            return filtered
        } else {
            return names
        }
    }

    // MARK: - UI
    
    private var headerTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .webSearch
        textField.returnKeyType = .search
        textField.setupAppearance(placeholder: "search")
        return textField
    }()
    
    private lazy var list = UITableView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup ViewController
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupView() {
        view.backgroundColor = .black
        headerTextField.delegate = self
    }
    
    // MARK: - TableView
    
    private func setupTableView() {
        list.delegate = self
        list.dataSource = self
        list.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        list.backgroundColor = .clear
        list.separatorColor = .white
        list.layer.cornerRadius = view.frame.width * 0.05
        
        list.tableFooterView = UIView(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchedResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = list.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searchedResults[indexPath.row]
        cell.backgroundColor = .lightGray
        cell.setSelectedColor(Constants.Colors.accentColor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    // MARK: - Setup hierarchy
    
    private func setupHierarchy() {
        view.addSubview(headerTextField)
        view.addSubview(list)
    }
    
    // MARK: - Setup layout
    
    private func setupLayout() {
        headerTextField.snp.makeConstraints { make in
            make.top.equalTo(view).inset(Constants.Layout.elementHeight)
            make.left.equalTo(view).offset(Constants.Layout.elementHeight)
            make.right.equalTo(view).inset(Constants.Layout.elementHeight)
            make.height.equalTo(Constants.Layout.elementHeight * 1.5)
        }
        list.snp.makeConstraints { make in
            make.left.equalTo(view).offset(Constants.Layout.elementHeight)
            make.right.equalTo(view).inset(Constants.Layout.elementHeight)
            make.top.equalTo(headerTextField.snp.bottom).offset(Constants.Layout.elementHeight)
            make.bottom.equalTo(view).multipliedBy(0.9)
        }
    }
    
    // MARK: - Actions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        headerTextField.resignFirstResponder()
        list.reloadData()
        return true
    }
    
}


