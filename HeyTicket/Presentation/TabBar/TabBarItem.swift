//
//  TabBarItem.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/01.
//

import Foundation
import UIKit
import HeyTicketKit

enum TabBarItem: Int, CaseIterable {
    case home
    case category
    case mypage
}

extension TabBarItem {
    
    private var getItemInfo: TabBarItemInfo {
        switch self {
        case .home:         return HomeTabItem()
        case .category:     return CategoryTabItem()
        case .mypage:       return MyPageTabItem()
        }
    }
    public func asTabBarItem() -> UITabBarItem {
        let itemInfo = getItemInfo
        return UITabBarItem(
            title: itemInfo.title,
            image: itemInfo.icon,
            selectedImage: itemInfo.icon
        )
    }
}

protocol TabBarItemInfo{
    var title: String { get }
    var icon: UIImage { get }
}

struct HomeTabItem: TabBarItemInfo{
    let title: String = "홈"
    let icon: UIImage = Image.homeTab
}

struct CategoryTabItem: TabBarItemInfo{
    let title: String = "카테고리"
    let icon: UIImage = Image.categoryTab
}

struct MyPageTabItem: TabBarItemInfo{
    let title: String = "마이"
    let icon: UIImage = Image.mypageTab
}
