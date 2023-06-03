//
//  CategoryDIContainer.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/03.
//

import UIKit

final class CategoryDIContainer: DIContainer {
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator
    func makeCategoryCoordinator() -> CategoryCoordinator {
        CategoryCoordinator(
            DIContainer: self,
            navigationController: navigationController
        )
    }
    
    func makeCategoryViewController() -> CategoryViewController {
        CategoryViewController()
    }
}

