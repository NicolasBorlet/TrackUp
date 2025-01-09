//
//  UITabBarController.swift
//  TrackUp
//
//  Created by Nicolas Borlet on 09/01/2025.
//
import SwiftUI

extension UITabBarController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 20
        // Choose with corners should be rounded
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // top left, top right
    }
}
