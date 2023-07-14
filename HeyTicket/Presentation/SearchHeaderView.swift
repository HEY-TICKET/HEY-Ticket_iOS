//
//  SearchHeaderView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/07/07.
//

import HeyTicketKit
import UIKit

class SearchHeaderView: NavigationHeaderView{
    
    let textField: SearchTextField = SearchTextField()
    
    init(keyword: String?){
        super.init()
        textField.text = keyword
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        addSubview(textField)
    }
    
    override func layout() {
        super.layout()
        self.snp.updateConstraints{
            $0.height.equalTo(56)
        }
        textField.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(backBtn.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
