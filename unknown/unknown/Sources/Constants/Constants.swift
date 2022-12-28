//
//  Constants.swift
//  unknown
//
//  Created by Nikita Alpatiev on 12/27/22.
//

import UIKit

enum Constants {
    enum Colors {
        static var background = UIColor.black
        static var fillElements = UIColor.darkGray
        static var borderColor = UIColor.lightGray.cgColor
        static var prefferedText = UIColor.white
    }
    
    enum Fonts {
        static var headers = UIFont.boldSystemFont(ofSize: 22)
        static var description = UIFont.italicSystemFont(ofSize: 18)
    }
    
    enum Layout {
        static var cornerRadius: CGFloat = 15
        static var borderWidth: CGFloat = 2
        static var elementWidth: CGFloat = 90
        static var elementHeight: CGFloat = 30
    }
}

