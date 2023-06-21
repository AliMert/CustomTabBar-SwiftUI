//
//  CustomTabButton.swift
//  CustomTabBar
//
//  Created by Ali Mert Özhayta on 13.06.2023.
//

import SwiftUI

struct CustomTabButton<T: TabBarItemProtocol>: View {
    var currentTab: T
    @Binding var selectedTab: T

    var body: some View {
        Button {
            selectedTab = currentTab
        } label: {
            Image(systemName: currentTab.imageName)
                .foregroundColor(selectedTab == currentTab ? Color(uiColor: .systemOrange) : Color.gray.opacity(0.8))
                .padding()
        }
    }
}
