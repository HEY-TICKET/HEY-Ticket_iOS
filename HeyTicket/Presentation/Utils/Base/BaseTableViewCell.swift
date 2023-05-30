//
//  BaseTableViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/05/30.
//

import Foundation
import UIKit
import SnapKit

class BaseTableViewCell: UITableViewCell{
    
    var cellIndexPath: IndexPath?{
        (superview as? UITableView)?.indexPath(for: self)
    }
    
    let baseView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        template()
        self.style()
        hierarchy()
        layout()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final private func template(){
        setBaseView()
        selectedBackgroundView = UIView()
    }
    
    private func setBaseView(){
        baseView.backgroundColor = .white
        contentView.addSubview(baseView)
        baseView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func style() { }
    func hierarchy() { }
    func layout() { }
    func initialize() { }
}
