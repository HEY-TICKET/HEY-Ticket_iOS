//
//  CategoryHeaderView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/07/07.
//

import HeyTicketKit
import UIKit

class CategoryHeaderView: BaseHeaderView{
    
    let searchTextField: SearchTextField = {
        let textField = SearchTextField()
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    override func hierarchy(){
        addSubviews([searchTextField])
    }
    
    override func layout(){
        self.snp.updateConstraints{
            $0.height.equalTo(60)
        }
        searchTextField.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

