//
//  TableOnlyView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit
import SnapKit

class TableOnlyView: BaseView{
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()
    
    override func hierarchy() {
        addSubview(tableView)
    }
    
    override func layout() {
        tableView.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func registerCellTypes(_ types: [BaseTableViewCell.Type]){
        types.forEach{
            tableView.register(cellType: $0)
        }
    }
}
