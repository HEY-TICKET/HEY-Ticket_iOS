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
    
    func showLogin(){
        let viewController = LoginViewController(viewModel: LoginViewModel())
        viewController.modalPresentationStyle = .fullScreen
        navigationController.present(viewController, animated: true)
    }
    
    func showRegisterInterest(){
//        navigationController.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: true)
    }
    
    func showMoreItems(isNew: Bool){
        navigationController.pushViewController(MoreTicketViewController(isNew: isNew), animated: true)
    }
}
