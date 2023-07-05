//
//  PasswordSettingViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/24.
//

import Foundation
import HeyTicketKit

class PasswordSettingViewController: BaseViewController<NavigationHeaderView.ButtonType, PasswordSettingView>{
    
    init(){
        super.init(headerView: NavigationButtonHeaderView.generate(btnImage: Image.cancel.withTintColor(Color.grey900)), mainView: PasswordSettingView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
