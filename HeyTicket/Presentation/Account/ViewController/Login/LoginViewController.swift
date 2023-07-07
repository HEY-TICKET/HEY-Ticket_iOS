//
//  LoginViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/17.
//

import Foundation
import UIKit
import HeyTicketKit
import RxSwift

class LoginViewController: BaseViewController<NavigationHeaderView, LoginView>{
    
    private let viewModel: any LoginViewModelInterface
    
    init(viewModel: any LoginViewModelInterface){
        self.viewModel = viewModel
        super.init(headerView: NavigationHeaderView(), mainView: LoginView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bind() {
        
        guard let viewModel = viewModel as? LoginViewModel else { return }
        
        let input = LoginViewModel.Input(email: mainView.textFieldFrame.textField.rx.text.orEmpty.asObservable())
        
        let ouput = viewModel.transform(input)
        
        ouput.isEmailValidate
            .drive{ [weak self] isValid in
                self?.mainView.isWarningState = !isValid
                self?.mainView.ctaButton.isEnabled = isValid
                self?.mainView.informationLabel.willHidden = isValid
            }.disposed(by: disposeBag)
    }
}
