//
//  LoginView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/17.
//

import HeyTicketKit
import UIKit
import SnapKit

class LoginView: BaseView, ShowInformationDelegate{
    
    var isWarningState: Bool = false{
        didSet{
            informationLabel.willWarning = isWarningState
            textFieldFrame.isWarning = isWarningState
        }
    }
    
    lazy var informationLabel: TextFieldFrame.InformationLabel = {
        let label = TextFieldFrame.InformationLabel(textField: textFieldFrame, warningMessage: "이메일 형식에 맞게 입력해 주세요")
        label.delegate = self
        return label
    }()
    
    private let logoLabel: UILabel = {
       let label = UILabel()
        label.text = "HEY TICKET"
        label.font = Typo.font(type: .Black, size: 32)
        label.textColor = Color.grey900
        return label
    }()
    
    let textFieldFrame: TextFieldFrame = TextFieldFrame(title: "이메일 주소", placeholder: "abcd@heyticket.co.kr")
    
    lazy var ctaButton: CTAButton = {
        let button = CTAButton(title: "이메일로 계속하기", color: .fillDark, configuration: .height48)
        button.isEnabled = false
        return button
    }()
    
    lazy var kakaoButton: UIButton = {
        var configuration = CTAButton(title: "카카오로 계속하기", color: .fillDark, configuration: .height50).configuration!
        configuration.background.backgroundColor = UIColor(r: 255, g: 225, b: 65)
        configuration.attributedTitle?.foregroundColor = Color.grey800
        return UIButton(configuration: configuration)
    }()
    
    override func hierarchy() {
        addSubviews([logoLabel, textFieldFrame, informationLabel, ctaButton, kakaoButton])
    }
    
    override func layout() {
        
        logoLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
        }
        textFieldFrame.snp.makeConstraints{
            $0.top.equalTo(logoLabel.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        kakaoButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(80)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        informationLabel.initialize()
    }
    
    func remakeConstraintsOfUnderView(state isHidden: Bool) {
        let target: UIView = isHidden ? textFieldFrame : informationLabel
        ctaButton.snp.remakeConstraints{
            $0.top.equalTo(target.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
