//
//  InterestKeywordCancelChipCollectionViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/29.
//

import UIKit
import HeyTicketKit

class InterestKeywordCancelChipCollectionViewCell: ChipCancelCollectionViewCell{
    
    private static let deselectAttribute: ChipAttribute = CancelChipAttribute()
    
    override func style() {
        super.style()
        deselectedAttribute = InterestKeywordCancelChipCollectionViewCell.deselectAttribute
    }
}


private struct CancelChipAttribute: ChipAttribute{
    let configuration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.bordered()
        configuration.background.strokeColor = Color.grey200
        configuration.background.strokeWidth = 1
        configuration.baseBackgroundColor = .white
        configuration.cornerStyle = .capsule
        configuration.contentInsets = CancelChipDeselectedAttribute().configuration.contentInsets
        return configuration
    }()
    
    let titleAttributes: AttributeContainer = {
        var container = AttributeContainer()
        container.font = Typo.appleFont(type: .Regular, size: 14)
        container.foregroundColor = Color.grey900
        return container
    }()
}
