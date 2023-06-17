//
//  FilteringModalView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/14.
//

import HeyTicketKit
import UIKit

class SortingModalBottomView: BaseView, BaseModalBottomViewInterface{
    
    lazy var ctaButton: CTAButton = CTAButton(title: "적용")
    
    override func hierarchy() {
        addSubview(ctaButton)
    }
    
    override func layout() {
        ctaButton.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(topBottomOffset)
            $0.leading.trailing.equalToSuperview().inset(defaultSideOffset)
        }
    }
}

//class FilteringModalView: BaseView{
//
//    let tableView: UITableView = {
//        let tableView = UITableView()
//        return tableView
//    }()
//
//    override func hierarchy() {
//        addSubviews([tableView])
//    }
//
//    override func layout() {
//        tableView.snp.makeConstraints{
//            $0.top.leading.trailing.equalToSuperview()
//        }
//    }
//}
