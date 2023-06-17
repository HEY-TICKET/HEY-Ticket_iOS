//
//  RankingShowCollectionViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/05.
//

import UIKit
import SnapKit
import HeyTicketKit

protocol BindingTicketRanking{
    var rankingTag: UILabel { get }
    func bindingData(_ data: Ticket, ranking: Int)
}

extension BindingTicketRanking{
    static var rankingTagLabel: UILabel{
        let label = UILabel()
        label.backgroundColor = .black.withAlphaComponent(0.8)
        label.textColor = .white
        label.font = Typo.font(type: .Bold, size: 12)
        label.layer.cornerRadius = 6
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }
    
    func rankingTagLayout(){
        rankingTag.snp.makeConstraints{
            $0.top.leading.equalToSuperview().offset(4)
            $0.width.height.equalTo(24)
        }
    }
}

class RankingTicketCollectionViewCell: HomeTicketCollectionViewCell, BindingTicketRanking{
    
    let rankingTag: UILabel = rankingTagLabel
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(rankingTag)
    }
    
    override func layout() {
        super.layout()
        rankingTagLayout()
    }
    
    func bindingData(_ data: Ticket, ranking: Int) {
        rankingTag.text = "\(ranking)"
        super.bindingData(data)
    }
}
