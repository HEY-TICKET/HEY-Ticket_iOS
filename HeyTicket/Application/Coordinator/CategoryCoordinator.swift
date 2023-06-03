//
//  CategoryCoordinator.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/03.
//

import UIKit

final class CategoryCoordinator: Coordinator {
    
    let DIContainer: CategoryDIContainer
    private let navigationController: UINavigationController

    init(DIContainer: CategoryDIContainer, navigationController: UINavigationController) {
        self.DIContainer = DIContainer
        self.navigationController = navigationController
    }

    func start() {
        startCategory()
    }

    func startCategory() {
        let categoryViewController = DIContainer.makeCategoryViewController()
        categoryViewController.coordinator = self
        navigationController.pushViewController(categoryViewController, animated: true)
    }

    func popRequestRegion() {
        navigationController.popViewController(animated: true)
    }
}
