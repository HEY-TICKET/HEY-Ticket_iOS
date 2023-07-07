//
//  EmailCeritificationView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation
import HeyTicketKit
import UIKit

class EmailCeritificationView: BaseView, ShowInformationDelegate{
    
    var isWarning: Bool = false{
        didSet{
            certificationFrame.isWarning = isWarning
            warningLabel.willWarning = isWarning
            warningLabel.willHidden = !isWarning
        }
    }
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "인증 메일이 발송되었어요"
        label.font = Typo.font(type: .Bold, size: 24)
        label.textColor = Color.grey900
        return label
    }()
    
    private let subtitleLabel: UILabel = {
       let label = UILabel()
        label.text = "입력하신 이메일 주소로 인증 코드가 발송되었어요.\n인증 코드를 입력해 주세요."
        label.textAlignment = .center
        label.font = Typo.font(type: .Regular, size: 14)
        label.textColor = Color.grey500
        return label
    }()
    
    let emailFrame: TextFieldFrame = {
       let textField = TextFieldFrame(title: "이메일 주소")
        textField.isLocked = true
        return textField
    }()
    
    lazy var certificationFrame: TextFieldFrame = {
       let frame = TextFieldFrame(title: "인증코드 입력", placeholder: "6자리 입력")
        frame.textField.keyboardType = .numberPad
        return frame
    }()
    
    lazy var warningLabel: TextFieldFrame.InformationLabel = {
        let label = TextFieldFrame.InformationLabel(textField: certificationFrame, warningMessage: "인증코드가 일치하지 않아요. 다시 입력해 주세요.")
        label.delegate = self
        return label
    }()
    
    let timeoutLabel: UILabel = {
        let label = UILabel()
        label.text = "유효시간 02:51"
        label.font = Typo.font(type: .Regular, size: 12)
        label.textColor = Color.orange
        return label
    }()
    
    lazy var resendButton: UIButton = {
        
        var attributedString = NSMutableAttributedString("인증번호 다시 받기")
        attributedString
            .addAttributes([
                .font: Typo.font(type: .Regular, size: 12),
                .foregroundColor: Color.grey500,
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ], range: NSRange(location: 0, length: attributedString.length))
        
        let copy = attributedString.copy() as! NSAttributedString
        var selectedAttributedString = NSMutableAttributedString(attributedString: copy)
        selectedAttributedString.addAttributes([.foregroundColor: Color.blueTagText], range: NSRange(location: 0, length: attributedString.length))
        
       let button = UIButton()
        button.setAttributedTitle(attributedString, for: .normal)
        button.setAttributedTitle(selectedAttributedString, for: .selected)
        return button
    }()
    
    
    let buttonFrame: CTAButtonFrame = CTAButtonFrame(ctaButton: CTAButton(title: "다음", color: .fillDark, configuration: .height50))
    
    override func hierarchy() {
        certificationFrame.textField.addSubview(timeoutLabel)
        addSubviews([titleLabel, subtitleLabel, emailFrame, certificationFrame, warningLabel, resendButton, buttonFrame])
    }
    
    override func layout() {
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        emailFrame.snp.makeConstraints{
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        certificationFrame.snp.makeConstraints{
            $0.top.equalTo(emailFrame.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(emailFrame)
        }
        
        buttonFrame.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        warningLabel.initialize()
        
        timeoutLabel.snp.makeConstraints{
            $0.centerY.trailing.equalToSuperview()
        }
    }
    
    func remakeConstraintsOfUnderView(state isHidden: Bool) {
        let target: UIView = isHidden ? certificationFrame : warningLabel
        resendButton.snp.remakeConstraints{
            $0.top.equalTo(target.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(20)
        }
    }
}
