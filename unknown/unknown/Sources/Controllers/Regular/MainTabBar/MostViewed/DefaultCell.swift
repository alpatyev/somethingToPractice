//
//  DefaultCell.swift
//  unknown
//
//  Created by Nikita Alpatiev on 1/10/23.
//

import UIKit
import SnapKit

class DefaultCell: UICollectionViewCell {
    
    static let identifier = "DefaultCell"
    
    // MARK: - UI elements
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "book")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white.withAlphaComponent(0.5)
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "SALE: $12"
        label.textColor = .white
        label.textAlignment = .center
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.backgroundColor = .black.withAlphaComponent(0.5)
        return label
    }()
    
    lazy var downloadLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.text = "download"
        label.textColor = .white
        label.textAlignment = .center
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.backgroundColor = .black.withAlphaComponent(0.5)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray.withAlphaComponent(0.3)
        clipsToBounds = true
        layer.cornerRadius = frame.width / 20
        image.layer.cornerRadius = frame.width / 10
        descriptionLabel.layer.cornerRadius = frame.width / 20
        downloadLabel.layer.cornerRadius = frame.width / 20
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupHierarchy()
        setupLayout()
    }
    
    override func prepareForReuse() {
        //image.image = nil
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(downloadLabel)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.size.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.centerY.lessThanOrEqualToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.width.equalTo(image).multipliedBy(0.6)
            make.height.equalToSuperview().multipliedBy(0.1)
            make.centerY.equalTo(image.snp.bottom)
            make.left.equalTo(image)
        }
        
        downloadLabel.snp.makeConstraints { make in
            make.left.equalTo(descriptionLabel.snp.right).offset(5)
            make.right.equalTo(image)
            make.height.equalToSuperview().multipliedBy(0.1)
            make.centerY.equalTo(image.snp.bottom)
        }
    }
}
