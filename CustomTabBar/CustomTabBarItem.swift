//
//  CustomTabBarItem.swift
//  CustomTabBar
//
//  Created by Ali Mert Özhayta on 13.06.2023.
//

import SwiftUI

enum CustomTabBarItem: TabBarItemProtocol {
    case home
    case mail
    case files
    case settings

    var tag: Int {
        switch self {
        case .home:
            return 0
        case .mail:
            return 1
        case .files:
            return 2
        case .settings:
            return 3
        }
    }

    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .mail:
            return "envelope.fill"
        case .files:
            return "folder.fill"
        case .settings:
            return "gearshape.fill"
        }
    }

    func getContent() -> some View {
        switch self {
        case .home:
            ScrollView {
                ForEach(0..<20, id: \.self) { index in
                    Text("Home \(index)")
                        .padding()
                        .background(Color.blue.opacity(0.4))
                        .clipShape(Capsule())
                        .frame(maxWidth: .infinity)

                }
            }
            .frame(maxHeight: .infinity)
            .setupCustomTab(tab: CustomTabBarItem.home)
        case .mail:
            ScrollView {
                ForEach(0..<20, id: \.self) { index in
                    Text("Message \(index)")
                        .padding()
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(maxHeight: .infinity)
            .setupCustomTab(tab: CustomTabBarItem.mail)
        case .files:
            NavigationStack {
                NavigationLink {
                    Text("Nav Detail")
                        .navigationTitle("Welcome")
                } label: {
                    Text("Go To Navigation Detail")
                }
                .navigationTitle("Navigation Title")
            }
            .setupCustomTab(tab: CustomTabBarItem.files)
        case .settings:
            Text("Settings")
                .setupCustomTab(tab: CustomTabBarItem.settings)
        }
    }
}
