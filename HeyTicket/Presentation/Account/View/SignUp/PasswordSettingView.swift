//
//  PasswordSettingView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/24.
//

import UIKit
import HeyTicketKit

class PasswordSettingView: BaseView{
    
    let titleFrame: TitleFrame = TitleFrame(title: "비밀번호를 입력해주세요")
    
    let passwordFrame: TextFieldFrame = {
        let frame = TextFieldFrame(case: .password)
        frame.isSecurityNeed = true
        return frame
    }()
    
    private lazy var informationAndWarningLabel: TextFieldFrame.InformationLabel = {
        let label = TextFieldFrame.InformationLabel(textField: passwordFrame, case: .password)
        label.willHidden = false
        return label
    }()
    
    let buttonFrame: CTAButtonFrame = {
        let frame = CTAButtonFrame(ctaButton: CTAButton(title: "다음", color: .fillDark, configuration: .height50))
        frame.ctaButton.isEnabled = false
        return frame
    }()
    
    override func hierarchy() {
        addSubviews([titleFrame, passwordFrame, informationAndWarningLabel, buttonFrame])
    }
    
    override func layout() {
        
        titleFrame.snp.makeConstraints{
            $0.top.equalToSuperview().offset(titleFrame.topOffset)
            $0.leading.trailing.equalToSuperview()
        }
        
        passwordFrame.snp.makeConstraints{
            $0.top.equalTo(titleFrame.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        buttonFrame.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        informationAndWarningLabel.initialize()
    }
}
