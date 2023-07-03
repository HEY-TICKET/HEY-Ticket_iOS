//
//  PasswordLoginView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/21.
//

import Foundation
import HeyTicketKit
import UIKit

class PasswordLoginView: BaseView{
    
    var isWarning: Bool = false{
        didSet{
            informationLabel.willWarning = isWarning
            textFieldFrame.isWarning = isWarning
        }
    }
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "HEY TICKET"
        label.font = Typo.font(type: .Black, size: 32)
        label.textColor = Color.grey900
        return label
    }()
    
    let emailTextField: TextFieldFrame = {
        let textField = TextFieldFrame(title: "이메일 주소")
        textField.isLocked = true
        return textField
    }()
    
    let textFieldFrame: TextFieldFrame = {
        let textField = TextFieldFrame(title: "비밀번호", placeholder: "비밀번호 입력")
        textField.isSecurityNeed = true
        return textField
    }()
    
    private lazy var informationLabel: TextFieldFrame.InformationLabel = {
        let textField = TextFieldFrame.InformationLabel(textField: textFieldFrame, warningMessage: "이메일 주소 혹은 비밀번호를 확인해 주세요", informationMessage: "영문 대문자, 소문자, 숫자 포함 8자 이상")
        textField.willHidden = false
        return textField
    }()
    
    lazy var ctaButton: CTAButton = {
        let button = CTAButton(title: "로그인", color: .fillDark, configuration: .height48)
        button.isEnabled = false
        return button
    }()
    
    let passwordFindButton: UILabel = {
       let label = UILabel()
        let attributedText = NSMutableAttributedString("비밀번호 찾기")
        attributedText
            .addAttributes([
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: Color.grey500,
                .font: Typo.font(type: .Medium, size: 14)
            ], range: NSRange(location: 0, length: attributedText.length)
        )
        label.attributedText = attributedText
        return label
    }()
    
    
    override func hierarchy() {
        addSubviews([logoLabel, emailTextField, textFieldFrame, informationLabel, ctaButton, passwordFindButton])
    }
    
    override func layout() {
        
        logoLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(logoLabel.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        textFieldFrame.snp.makeConstraints{
            $0.top.equalTo(emailTextField.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        ctaButton.snp.makeConstraints{
            $0.top.equalTo(informationLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        passwordFindButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(44)
        }
        
        informationLabel.initialize()
    }
}
