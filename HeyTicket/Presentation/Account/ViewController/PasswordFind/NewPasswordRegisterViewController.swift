//
//  NewPasswordRegisterViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/24.
//

import Foundation
import HeyTicketKit

class NewPasswordRegisterViewController: BaseViewController<NavigationHeaderView.ButtonType, NewPasswordRegisterView>{
    
    init(){
        super.init(headerView: NavigationButtonHeaderView.generate(btnImage: Image.cancel.withTintColor(Color.grey900)), mainView: NewPasswordRegisterView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var keyboardController: KeyboardController = KeyboardController(view: mainView.buttonFrame, moveHeight: Device.safeBottomOffset)
}
