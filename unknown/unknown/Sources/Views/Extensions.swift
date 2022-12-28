//
//  Extensions.swift
//  unknown
//
//  Created by Nikita Alpatiev on 12/27/22.
//

import UIKit

extension UIButton {
    func setupAppearance(text: String) {
        self.layer.cornerRadius = Constants.Layout.cornerRadius
        self.layer.borderWidth = Constants.Layout.borderWidth
        self.layer.borderColor = Constants.Colors.borderColor

        self.setTitle(text, for: .normal)
        self.setTitleColor(Constants.Colors.prefferedText,
                             for: .normal)
        self.setTitleColor(Constants.Colors.fillElements,
                             for: .highlighted)
    }
}

extension UILabel {
    func setupAppearance(text: String) {
        self.layer.cornerRadius = Constants.Layout.cornerRadius
        self.layer.borderWidth = Constants.Layout.borderWidth
        self.layer.borderColor = Constants.Colors.borderColor

        self.font = Constants.Fonts.headers
        self.textColor = Constants.Colors.prefferedText
        self.text = text
        self.textAlignment = .center
    }
}

