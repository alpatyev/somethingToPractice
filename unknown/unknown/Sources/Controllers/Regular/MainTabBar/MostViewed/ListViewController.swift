//
//  ListViewController.swift
//  unknown
//
//  Created by Nikita Alpatiev on 12/28/22.
//

import UIKit

final class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - UI
    
    private lazy var list: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(DefaultCell.self,
                            forCellWithReuseIdentifier: DefaultCell.identifier)
        return collection
    }()
        
    // MARK: - Lifecycle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup ViewController
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupHierarchy() {
        view.addSubview(list)
    }
    
    // MARK: - Setup layout
    
    private func setupLayout() {
        list.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    // MARK: - Actions
    
}

// MARK: - Collection stubs

extension ListViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        123
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = list.dequeueReusableCell(withReuseIdentifier: DefaultCell.identifier,
                                            for: indexPath)
        return cell
    }
}

