//
//  SignUpAgreementTableViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/30.
//

import HeyTicketKit
import UIKit

class SignUpAgreementTableViewCell: BaseTableViewCell{
    
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.font = Typo.font(type: .Medium, size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.textColor = Color.grey500
        return label
    }()
    
    lazy var checkBox: UIButton = {
        let button = UIButton()
        button.setImage(Image.checkBoxUncheck, for: .normal)
        button.setImage(Image.checkBoxCheck, for: .selected)
        return button
    }()
    
    func setInformation(_ information: String){
        informationLabel.text = information
    }
    
    override func hierarchy() {
        addSubviews([informationLabel, checkBox])
    }
    
    override func layout() {
        baseView.snp.makeConstraints{
            $0.height.equalTo(50)
        }
        informationLabel.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(20)
        }
        checkBox.snp.makeConstraints{
            $0.width.height.equalTo(20)
            $0.leading.equalTo(informationLabel.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(informationLabel)
        }
    }
}
