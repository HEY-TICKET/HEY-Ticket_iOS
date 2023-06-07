//
//  HomeHeaderView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import Foundation
import UIKit
import HeyTicketKit
import SnapKit

class HomeHeaderView: TabBarHeaderView{
    
    private let logoView: UILabel = {
       let label = UILabel()
        label.text = "HEY TICKET"
        label.setTypo(Typo.font(type: .Black, size: 20))
        return label
    }()
    
    init(){
        super.init(leftImage: Image.search, rightImage: Image.alarm)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        addSubview(logoView)
        logoView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(9)
            $0.centerY.equalToSuperview()
        }
    }
}
