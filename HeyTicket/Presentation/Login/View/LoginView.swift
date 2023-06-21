//
//  LoginView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/17.
//

import HeyTicketKit
import UIKit
import SnapKit

protocol ShowTextFieldInformation{
    var isWarningState: Bool { get }
    var isInformationLabelHidden: Bool { get }
    var textFieldFrame: TextFieldFrame { get }
    var informationLabel: UILabel { get }
    var warningMessage: String? { get }
    var informationMessage: String? { get }
    func remakeConstraintsUnderView()
}

extension ShowTextFieldInformation where Self: BaseView{
    
    private var attributes: (message: String?, color: UIColor){
        isWarningState ? (warningMessage, Color.red) : (informationMessage, Color.grey500)
    }
    
    var informationLabelFont: UIFont{
        Typo.font(type: .Regular, size: 12)
    }
    
    func setInformationLabelLayout(){
        if isInformationLabelHidden {
            hiddenLabel()
        } else {
            showLabel()
        }
    }
    
    private func showLabel(){
        informationLabel.snp.remakeConstraints{
            $0.top.equalTo(textFieldFrame.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    func hiddenLabel(){
        informationLabel.snp.remakeConstraints{
            $0.bottom.equalTo(informationLabel)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    private func setTextFieldAndLabelAttributes(){
        textFieldFrame.isWarningState = isWarningState
        informationLabel.text = attributes.message
        informationLabel.textColor = attributes.color
    }

    func checkWarningState(_ oldValue: Bool){
        if oldValue != isWarningState{
            setTextFieldAndLabelAttributes()
        }
    }
    
    func checkInformationLabelHiddenState(_ oldValue: Bool){
        if oldValue != isInformationLabelHidden{
            setInformationLabelLayout()
            remakeConstraintsUnderView()
        }
    }
}

class LoginView: BaseView, ShowTextFieldInformation{
    
    var isWarningState: Bool = false{
        didSet{
            checkWarningState(oldValue)
        }
    }
    
    var isInformationLabelHidden: Bool = true{
        didSet{
            checkInformationLabelHiddenState(oldValue)
        }
    }
    
    let warningMessage: String? = "이메일 형식에 맞게 입력해 주세요"
    let informationMessage: String? = nil
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.font = informationLabelFont
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
        remakeConstraintsUnderView()
        hiddenLabel()
    }
    
    func remakeConstraintsUnderView() {
        let target: UIView = isInformationLabelHidden ? textFieldFrame : informationLabel
        ctaButton.snp.remakeConstraints{
            $0.top.equalTo(target.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
