//
//  CustomTabBarApp.swift
//  CustomTabBar
//
//  Created by Ali Mert Özhayta on 12.06.2023.
//

import SwiftUI

@main
struct CustomTabBarApp: App {

    var body: some Scene {
        WindowGroup {
            CustomTabBar(selectedTab: .home, allCases: CustomTabBarItem.allCases)
        }
    }
}
