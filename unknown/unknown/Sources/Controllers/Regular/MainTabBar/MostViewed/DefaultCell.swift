//
//  DefaultCell.swift
//  unknown
//
//  Created by Nikita Alpatiev on 1/10/23.
//

import UIKit

class DefaultCell: UICollectionViewCell {
    
    static let identifier = "DefaultCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
