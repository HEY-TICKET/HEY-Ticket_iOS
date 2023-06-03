//
//  MyPageDIContainer.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/03.
//

import UIKit

final class MyPageDIContainer: DIContainer {
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator
    func makeMyPageCoordinator() -> MyPageCoordinator {
        MyPageCoordinator(
            DIContainer: self,
            navigationController: navigationController
        )
    }
    
    func makeMyPageViewController() -> MyPageViewController{
        MyPageViewController()
    }
}
