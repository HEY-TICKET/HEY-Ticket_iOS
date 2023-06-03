//
//  MyPageCoordinator.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/03.
//

import UIKit

final class MyPageCoordinator: Coordinator {
    
    let DIContainer: MyPageDIContainer
    private let navigationController: UINavigationController

    init(DIContainer: MyPageDIContainer, navigationController: UINavigationController) {
        self.DIContainer = DIContainer
        self.navigationController = navigationController
    }

    func start() {
        startMyPage()
    }

    func startMyPage() {
        let myPageViewController = DIContainer.makeMyPageViewController()
        myPageViewController.coordinator = self
        navigationController.pushViewController(myPageViewController, animated: true)
    }

    func popRequestRegion() {
        navigationController.popViewController(animated: true)
    }
}
