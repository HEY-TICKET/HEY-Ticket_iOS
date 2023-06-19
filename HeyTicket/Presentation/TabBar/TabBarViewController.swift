//
//  TabBarViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/01.
//

import Foundation
import UIKit
import HeyTicketKit

class TabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setTabBarAppearance()
    }
    
    private func style(){
        view.backgroundColor = .white
    }
    
    private func setTabBarAppearance() {
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = Color.basicGrey100
        UITabBar.appearance().unselectedItemTintColor = Color.grey400
        
        let fontAttributes = [NSAttributedString.Key.font: Typo.font(type: .SemiBold, size: 10)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
    }
}
