//
//  UITabBar+Extensions.swift
//  CustomTabBar
//
//  Created by Ali Mert Özhayta on 13.06.2023.
//

import UIKit

extension UITabBar {

    private static var originalY: Double?

    static public func changeTabBarState(shouldHide: Bool) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach { view in
            guard let tabBar = view as? UITabBar else {
                return
            }

            if !tabBar.isHidden && shouldHide {
                originalY = (tabBar.superview?.frame.origin.y)!
                tabBar.superview?.frame.origin.y = (tabBar.superview?.frame.origin.y)! + 4.5
            } else if tabBar.isHidden && !shouldHide {
                guard let originalY else {
                    return
                }
                tabBar.superview?.frame.origin.y = originalY
            }

            tabBar.isHidden = shouldHide
            tabBar.superview?.setNeedsLayout()
            tabBar.superview?.layoutIfNeeded()
        }
    }
}
