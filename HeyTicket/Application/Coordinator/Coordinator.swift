//
//  Coordinator.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/03.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    associatedtype DIContainerProtocol: DIContainer
    var DIContainer: DIContainerProtocol { get }
    func start()
}

extension Coordinator{
    var window: UIWindow?{
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window 
    }
}
