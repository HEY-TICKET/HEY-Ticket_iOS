//
//  TabBarDIContainer.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/03.
//

import UIKit

final class TabBarDIContainer: DIContainer {
    
    private let tabBarController = TabBarController()
    private let homeNavigationController: UINavigationController = UINavigationController()
    private let categoryNavigationController: UINavigationController = UINavigationController()
    private let myPageNaviagtionConroller: UINavigationController = UINavigationController()
   
    func makeTabBarCoordinator() -> TabBarCoordinator {
        return TabBarCoordinator(
            DIContainer: self,
            tabBarController: tabBarController,
            homeNavigationController: homeNavigationController,
            categoryNavigationController: categoryNavigationController,
            myPageNavigationController: myPageNaviagtionConroller
        )
    }

    func makeHomeDIContainer() -> HomeDIContainer {
        return HomeDIContainer(navigationController: homeNavigationController)
    }
    
    func makeCategoryDIContainer() -> CategoryDIContainer{
        return CategoryDIContainer(navigationController: categoryNavigationController)
    }

    func makeMyPageDIContainer() -> MyPageDIContainer {
        return MyPageDIContainer(navigationController: myPageNaviagtionConroller)
    }
}
