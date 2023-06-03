//
//  MyPageTabViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/01.
//

import Foundation
import HeyTicketKit

class MyPageViewController: BaseViewController<TabBarHeaderView, BaseView>{
    
    var coordinator: MyPageCoordinator?
    
    init() {
        super.init(
            headerView: TabBarHeaderView(leftImage: Image.search, rightImage: Image.alarm),
            mainView: BaseView()
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
