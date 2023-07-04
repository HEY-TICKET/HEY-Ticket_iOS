//
//  EmailCertificationViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation
import HeyTicketKit
import UIKit

class EmailCertificationViewController: BaseViewController<NavigationHeaderView, EmailCeritificationView>{
    
    private let viewModel: any EmailCertificationViewModelInterface
    
    init(viewModel: any EmailCertificationViewModelInterface){
        self.viewModel = viewModel
        super.init(headerView: NavigationHeaderView(), mainView: EmailCeritificationView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var keyboardController: KeyboardController = KeyboardController(view: mainView.buttonFrame, moveHeight: Device.safeBottomOffset)
    
    override func viewWillAppear(_ animated: Bool) {
        keyboardController.addKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        keyboardController.removeKeyboardNotifications()
    }
    
    override func bind() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(willDismissKeyboard)))
        
        viewModel.timeoutSubject
            .subscribe{
                self.mainView.timeoutLabel.text = $0
            }.disposed(by: disposeBag)
        
        guard let viewModel = viewModel as? EmailCertificationViewModel else { return }
        
        let input = EmailCertificationViewModel.Input(code: mainView.certificationFrame.textField.rx.text.orEmpty.asObservable()
                                                      , willResendCode: mainView.resendButton.rx.tap)
        
        input.willResendCode
            .subscribe{ _ in
                self.mainView.resendButton.isSelected = true
            }.disposed(by: disposeBag)
        
        let output = viewModel.transform(input)
        
        output.isCodeValid
            .drive{ isValid in
                self.mainView.isWarning = !isValid
                self.mainView.buttonFrame.ctaButton.isEnabled = isValid
            }.disposed(by: disposeBag)
            
    }
    
    @objc private func willDismissKeyboard(){
        view.endEditing(true)
    }
}
