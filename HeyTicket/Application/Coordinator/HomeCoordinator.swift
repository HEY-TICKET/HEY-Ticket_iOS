//
//  HomeCoordinator.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/03.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    let DIContainer: HomeDIContainer
    private let navigationController: UINavigationController

    init(DIContainer: HomeDIContainer, navigationController: UINavigationController) {
        self.DIContainer = DIContainer
        self.navigationController = navigationController
    }

    func start() {
        startHome()
    }

    func startHome() {
        let homeViewController = DIContainer.makeHomeViewController()
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
    }

    func popRequestRegion() {
        navigationController.popViewController(animated: true)
    }
}