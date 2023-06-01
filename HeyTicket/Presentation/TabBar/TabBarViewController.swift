//
//  TabBarViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/01.
//

import Foundation
import UIKit
import HeyTicketKit

class TabBarViewController: UITabBarController{
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setTabBarAppearance()
        setTabBarItems()
    }
    
    
    private func setTabBarAppearance() {
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = Color.tabBarItem
        UITabBar.appearance().unselectedItemTintColor = Color.grey400
        
        let fontAttributes = [NSAttributedString.Key.font: Typo.font(type: .SemiBold, size: 10)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
    }
    
    private func setTabBarItems(){
        
        let tabs = [UINavigationController(rootViewController: HomeTabViewController()),
                    UINavigationController(rootViewController: CategoryTabViewController()),
                    UINavigationController(rootViewController: MyPageTabViewController())]
        
        TabBarItem.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.asTabBarItem()
        }
        
        setViewControllers(tabs, animated: true)
    }

}
