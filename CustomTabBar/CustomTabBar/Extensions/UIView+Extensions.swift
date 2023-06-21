//
//  UIView+Extensions.swift
//  CustomTabBar
//
//  Created by Ali Mert Özhayta on 13.06.2023.
//

import UIKit

extension UIView {

    func allSubviews() -> [UIView] {
        var allSubviews = subviews
        for subview in subviews {
            allSubviews.append(contentsOf: subview.allSubviews())
        }
        return allSubviews
    }
}
