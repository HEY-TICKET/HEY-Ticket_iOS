//
//  InterestTagCollectionViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/26.
//

import Foundation
import HeyTicketKit
import UIKit

class InterestChipCollectionViewCell: ChipCollectionViewCell{
    
    private static let selectAttribute: ChipAttribute = InterestChipSelectedAttribute()
    private static let deselectAttribute: ChipAttribute = InterestChipDeselectedAttribute()
    
    override func style() {
        selectedAttribute = InterestChipCollectionViewCell.selectAttribute
        deselectedAttribute = InterestChipCollectionViewCell.deselectAttribute
    }
    
    static func getSize(title: String) -> CGSize{
        let width = getWidth(
            title: title,
            selectAttribute: InterestChipCollectionViewCell.selectAttribute,
            deselectAttribute: InterestChipCollectionViewCell.deselectAttribute
        )
        return CGSize(width: width, height: 30)
    }
}


//MARK: CategoryTagAttribute implement
private extension ChipAttribute{
    static var insets: NSDirectionalEdgeInsets{
        NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 8, trailing: 12)
    }
}

private struct InterestChipSelectedAttribute: ChipAttribute{
    let configuration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .black
        configuration.cornerStyle = cornerAttribute
        configuration.contentInsets = insets
        return configuration
    }()
    
    let titleAttributes: AttributeContainer = {
        var container = AttributeContainer()
        container.font = Typo.appleFont(type: .Medium, size: 14)
        container.foregroundColor = .white
        return container
    }()
}

private struct InterestChipDeselectedAttribute: ChipAttribute{
    let configuration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.bordered()
        configuration.background.strokeColor = UIColor(r: 242, g: 243, b: 245)
        configuration.background.strokeWidth = 1
        configuration.baseBackgroundColor = .white
        configuration.cornerStyle = cornerAttribute
        configuration.contentInsets = insets
        return configuration
    }()
    
    let titleAttributes: AttributeContainer = {
        var container = AttributeContainer()
        container.font = Typo.appleFont(type: .Regular, size: 14)
        container.foregroundColor = UIColor(r: 152, g: 156, b: 161)
        return container
    }()
}
