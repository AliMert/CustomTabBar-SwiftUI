//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Ali Mert Özhayta on 12.06.2023.
//

import SwiftUI

public struct CustomTabBar<T: TabBarItemProtocol>: View {

    @State private var selectedTab: T
    private let allCases: [T]

    private var safeAreaInsets: UIEdgeInsets? {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets
    }

    public init(selectedTab: T, allCases: [T]) {
        self._selectedTab = State(initialValue: selectedTab)
        self.allCases = allCases
    }

    public var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(allCases, id: \.self) { tab in
                tab.getContent()
            }
        }
        .overlay(alignment: .bottom) {
            let bottomPadding = safeAreaInsets?.bottom  == 0 ? Constants.tabBarBottomPaddingForOlderDevices : 0

            getCustomTabBarView()
                .padding(.bottom, bottomPadding)
        }
        
    }

    @ViewBuilder
    private func getCustomTabBarView() -> some View {
        HStack {
            Spacer(minLength: 0)
            ForEach(allCases, id: \.self) { tab in
                CustomTabButton(currentTab: tab, selectedTab: $selectedTab)
                Spacer(minLength: 0)
            }
        }
        .frame(maxWidth: 600)
        .font(.title2.bold())
        .frame(height: Constants.customTabBarHeight)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .padding(.horizontal, 32)
        .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: -5)
    }
}

struct CustomTabBar_Previews: PreviewProvider {

    static var previews: some View {
        CustomTabBar(selectedTab: .home, allCases: CustomTabBarItem.allCases)
    }
}
