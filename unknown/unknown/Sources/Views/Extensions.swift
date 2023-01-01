//
//  Extensions.swift
//  unknown
//
//  Created by Nikita Alpatiev on 12/27/22.
//

import UIKit


extension UIView {
    func createShadowLayer(withCornerradius: CGFloat, opacity: Float = 0.5) {
        self.layer.shadowColor = Constants.Colors.accentColor.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = withCornerradius
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

extension UIButton {
    func setupAppearance(text: String) {
        self.layer.cornerRadius = Constants.Layout.cornerRadius
        self.layer.borderWidth = Constants.Layout.borderWidth
        self.layer.borderColor = Constants.Colors.borderColor

        self.setTitle(text, for: .normal)
        self.setTitleColor(Constants.Colors.prefferedText, for: .normal)
        self.setTitleColor(Constants.Colors.accentColor, for: .highlighted)
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

extension UITextField {
    func setupAppearance(placeholder: String = "_") {
        self.layer.cornerRadius = Constants.Layout.elementHeight / 1.5
        self.placeholder = placeholder
        self.textAlignment = .center
        self.textColor = Constants.Colors.accentColor
        self.backgroundColor = Constants.Colors.fillElements
        createShadowLayer(withCornerradius: self.layer.cornerRadius, opacity: 1)
    }
}

extension UITableViewCell {
    func setSelectedColor(_ color: UIColor) {
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = color
        self.selectedBackgroundView = backgroundColorView
    }
}
