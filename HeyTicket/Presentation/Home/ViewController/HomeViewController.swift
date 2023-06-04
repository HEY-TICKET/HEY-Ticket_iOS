//
//  HomeTabViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/01.
//

import Foundation
import HeyTicketKit

class HomeViewController: BaseViewController<TabBarHeaderView, BaseView>{
 
    var coordinator: HomeCoordinator?
    
    init() {
        super.init(
            headerView: HomeHeaderView(),
            mainView: BaseView()
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
