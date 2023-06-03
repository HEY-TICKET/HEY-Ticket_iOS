//
//  HomeDIContainer.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/03.
//

import UIKit

final class HomeDIContainer: DIContainer {
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator
    func makeHomeCoordinator() -> HomeCoordinator {
        HomeCoordinator(
            DIContainer: self,
            navigationController: navigationController
        )
    }
    
    func makeHomeViewController() -> HomeViewController {
        HomeViewController()
    }
}
