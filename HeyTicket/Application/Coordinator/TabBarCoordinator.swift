//
//  TabBarCoordinator.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/03.
//

import UIKit

final class TabBarCoordinator: Coordinator {

    let DIContainer: TabBarDIContainer
    private let tabBarController: UITabBarController
    private let homeNavigationController: UINavigationController
    private let cateogryNavigationController: UINavigationController
    private let myPageNavigationController: UINavigationController

    init(
        DIContainer: TabBarDIContainer,
        tabBarController: UITabBarController,
        homeNavigationController: UINavigationController,
        categoryNavigationController: UINavigationController,
        myPageNavigationController: UINavigationController
    ) {
        self.DIContainer = DIContainer
        self.tabBarController = tabBarController
        self.homeNavigationController = homeNavigationController
        self.cateogryNavigationController = categoryNavigationController
        self.myPageNavigationController = myPageNavigationController
    }

    func start() {
        window?.rootViewController = tabBarController
        setTabBarViewControllers()
        startHome()
        startCategory()
        startMyPage()
    }
    
    private func setTabBarViewControllers(){
        
        let tabs = [homeNavigationController,
                    cateogryNavigationController,
                    myPageNavigationController]
        
        TabBarItem.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.asTabBarItem()
        }
        
        tabBarController.setViewControllers(tabs, animated: true)
    }

    private func startHome() {
        let homeDIContainer = DIContainer.makeHomeDIContainer()
        let homeCoordinator = homeDIContainer.makeHomeCoordinator()
        homeCoordinator.start()
    }
    
    private func startCategory(){
        let categoryDIContainer = DIContainer.makeCategoryDIContainer()
        let categoryCoordinator = categoryDIContainer.makeCategoryCoordinator()
        categoryCoordinator.start()
    }

    private func startMyPage() {
        let myPageDIContainer = DIContainer.makeMyPageDIContainer()
        let homeCoordinator = myPageDIContainer.makeMyPageCoordinator()
        homeCoordinator.start()
    }
}
