//
//  RecommendShowCollectionViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/05.
//

import Foundation

class RecommendTicketCollectionViewCell: HomeTicketCollectionViewCell{
    override func layout() {
        posterImageHeight = TicketListView.recommendViewInfo.imageHeight
        super.layout()
    }
}
