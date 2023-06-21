//
//  TabBarItemProtocol.swift
//  CustomTabBar
//
//  Created by Ali Mert Özhayta on 13.06.2023.
//

import SwiftUI

public protocol TabBarItemProtocol: CaseIterable, Hashable {
    var tag: Int { get }
    var imageName: String { get }

    associatedtype Content: View
    @ViewBuilder func getContent() -> Content
}
