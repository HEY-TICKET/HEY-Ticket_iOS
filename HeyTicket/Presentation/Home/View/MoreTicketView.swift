//
//  MoreTicketView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/08.
//

import UIKit
import HeyTicketKit
import SnapKit

class MoreTicketView: BaseView{
    
    let filteringSection: FilteringSection = {
        let filterSection = FilteringSection()
        filterSection.title = "일간"
        return filterSection
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.contentInset = UIEdgeInsets(top: -10, left: 0, bottom: 20, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.registers(cellTypes: [MoreTicketTableViewCell.self, MoreRankingTicketTableViewCell.self])
        return tableView
    }()
    
    private let categoryTagCollectionView: CategorySelectTableViewCell = CategorySelectTableViewCell()
    
    override func hierarchy() {
        addSubviews([categoryTagCollectionView, filteringSection, tableView])
    }
    
    override func layout(){
        categoryTagCollectionView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        filteringSection.snp.makeConstraints{
            $0.top.equalTo(categoryTagCollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(filteringSection.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
