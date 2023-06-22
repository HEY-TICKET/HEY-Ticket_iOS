//
//  PasswordLoginViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/21.
//

import HeyTicketKit
import RxSwift
import RxCocoa

class PasswordLoginViewController: BaseViewController<NavigationHeaderView.TitleType, PasswordLoginView>{
    
    private let viewModel: PasswordLoginViewModel
    
    init(viewModel: PasswordLoginViewModel){
        self.viewModel = viewModel
        super.init(headerView: NavigationHeaderView.generate(title: "로그인"), mainView: PasswordLoginView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bind() {
        
        let input = PasswordLoginViewModel.Input(password: mainView.textFieldFrame.textField.rx.text.orEmpty.asObservable())
        
        let output = viewModel.transform(input)
        
        output.isPasswordValidate
            .drive{ isValid in
                self.mainView.isWarning = !isValid
            }.disposed(by: disposeBag)
    }
}
