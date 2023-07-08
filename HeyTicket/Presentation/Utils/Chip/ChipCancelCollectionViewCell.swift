//
//  ChipCancelCollectionViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/29.
//

import HeyTicketKit
import UIKit

class ChipCancelCollectionViewCell: ChipCollectionViewCell{
    
    private let cancelImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.cancel
        return imageView
    }()
    
    private static let selectAttribute: ChipAttribute = CancelChipSelectedAttribute()
    private static let deselectAttribute: ChipAttribute = CancelChipDeselectedAttribute()
    
    override func style() {
        selectedAttribute = ChipCancelCollectionViewCell.selectAttribute
        deselectedAttribute = ChipCancelCollectionViewCell.deselectAttribute
    }
    
    override func hierarchy() {
        super.hierarchy()
        titleBtn.addSubview(cancelImage)
    }
    
    override func layout() {
        super.layout()
        cancelImage.snp.makeConstraints{
            $0.width.height.equalTo(14)
            $0.leading.equalTo(titleBtn.titleLabel!.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
        }
    }
    
    override static func getSize(title: String, height: CGFloat) -> CGSize{
        let width = getWidth(
            title: title,
            selectAttribute: ChipCancelCollectionViewCell.selectAttribute,
            deselectAttribute: ChipCancelCollectionViewCell.deselectAttribute
        )
        return CGSize(width: width, height: height)
    }
}

//MARK: CategoryTagAttribute implement
private extension ChipAttribute{
    static var insets: NSDirectionalEdgeInsets{
        NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 8, trailing: 34)
    }
}

private struct CancelChipSelectedAttribute: ChipAttribute{
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

struct CancelChipDeselectedAttribute: ChipAttribute{
    let configuration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.bordered()
        configuration.background.strokeColor = Color.grey200
        configuration.background.strokeWidth = 1
        configuration.baseBackgroundColor = .white
        configuration.cornerStyle = cornerAttribute
        configuration.contentInsets = insets
        return configuration
    }()
    
    let titleAttributes: AttributeContainer = {
        var container = AttributeContainer()
        container.font = Typo.appleFont(type: .Regular, size: 14)
        container.foregroundColor = Color.grey500
        return container
    }()
}
