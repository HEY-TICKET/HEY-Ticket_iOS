//
//  PasswordFindViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/24.
//

import Foundation
import HeyTicketKit

class PasswordFindViewController: BaseViewController<NavigationHeaderView, PasswordFindView>{
    
    init(){
        super.init(headerView: NavigationHeaderView(), mainView: PasswordFindView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var keyboardController: KeyboardController = KeyboardController(view: mainView.bottomFrame, moveHeight: Device.safeBottomOffset)
    
    override func viewWillAppear(_ animated: Bool) {
        keyboardController.addKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        keyboardController.removeKeyboardNotifications()
    }
}
