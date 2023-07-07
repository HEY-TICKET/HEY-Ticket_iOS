//
//  PasswordFindView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/24.
//

import HeyTicketKit
import UIKit

class PasswordFindView: BaseView{
    
    private let titleFrame: TitleFrame = TitleFrame(title: "비밀번호 찾기", subtitle: "입력한 이메일로 인증코드를 전송해 드릴게요")
    
    let emailFrame: TextFieldFrame = TextFieldFrame(case: .email)
    
    private lazy var warningLabel: TextFieldFrame.InformationLabel = TextFieldFrame.InformationLabel(textField: emailFrame, case: .email)
    
    let bottomFrame: UIView = UIView()
    
    private let resignupMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소가 기억나지 않으시면\n다시 가입해 주세요."
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = Typo.font(type: .Medium, size: 14)
        label.textColor = Color.grey500
        return label
    }()
    
    let buttonFrame: CTAButtonFrame = {
        let frame = CTAButtonFrame(ctaButton: CTAButton(title: "다음", color: .fillDark, configuration: .height50))
        frame.ctaButton.isEnabled = false
        return frame
    }()
    
    override func hierarchy() {
        addSubviews([titleFrame, emailFrame, warningLabel, bottomFrame])
        bottomFrame.addSubviews([resignupMessageLabel, buttonFrame])
    }
    
    override func layout() {
        
        titleFrame.snp.makeConstraints{
            $0.top.equalToSuperview().offset(titleFrame.topOffset)
            $0.leading.trailing.equalToSuperview()
        }
        
        emailFrame.snp.makeConstraints{
            $0.top.equalTo(titleFrame.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        bottomFrame.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        resignupMessageLabel.snp.makeConstraints{
            $0.top.centerX.equalToSuperview()
        }
        
        buttonFrame.snp.makeConstraints{
            $0.top.equalTo(resignupMessageLabel.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        warningLabel.initialize()
    }
}
