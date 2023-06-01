//
//  TestViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/05/31.
//

import Foundation
import UIKit
import HeyTicketKit

class TestViewController: BaseViewController<NavigationHeaderView.ButtonType, BaseView>{
    
    init() {
        super.init(headerView: NavigationHeaderView.generate(btnImage: Image.alarm), mainView: BaseView())
    }
    
    required init?(coder: NSCoder) {
        super.init(headerView: NavigationHeaderView.generate(btnImage: Image.alarm), mainView: BaseView())
    }
    
    func test(){
    }
}
