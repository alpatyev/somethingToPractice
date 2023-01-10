//
//  NavigationController.swift
//  unknown
//
//  Created by Nikita Alpatiev on 1/10/23.
//

import UIKit

// MARK: - Setup background color for all navgation VC`s

extension UINavigationController {
   open override var preferredStatusBarStyle: UIStatusBarStyle {
      return topViewController?.preferredStatusBarStyle ?? .lightContent
   }
}

