//
//  RankingShowCollectionViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/05.
//

import UIKit
import SnapKit
import HeyTicketKit

protocol BindingRankingShow{
    func bindingData(_ data: Show, ranking: Int)
}

class RankingTicketCollectionViewCell: HomeTicketCollectionViewCell, BindingRankingShow{
    
    private let rankingTag: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black.withAlphaComponent(0.8)
        label.textColor = .white
        label.font = Typo.font(type: .Bold, size: 12)
        label.layer.cornerRadius = 6
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(rankingTag)
    }
    
    override func layout() {
        super.layout()
        rankingTag.snp.makeConstraints{
            $0.top.leading.equalToSuperview().offset(4)
            $0.width.height.equalTo(24)
        }
    }
    
    func bindingData(_ data: Show, ranking: Int) {
        rankingTag.text = "\(ranking)"
        super.bindingData(data)
    }
}
