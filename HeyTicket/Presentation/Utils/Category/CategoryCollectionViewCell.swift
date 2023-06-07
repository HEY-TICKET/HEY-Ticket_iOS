//
//  CategoryCollectionViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit
import HeyTicketKit

//MARK: CategoryAttribute - singleton properties

private protocol CategoryTagAttribute{
    var configuration: UIButton.Configuration { get }
    var titleAttributes: AttributeContainer { get }
}

private struct CategoryAttribute{
    static let selectState: CategoryTagAttribute = CategorySelectedAttribute()
    static let deselectState: CategoryTagAttribute = CategoryDeselectedAttribute()
}

class CategoryCollectionViewCell: BaseCollectionViewCell{
    
    var categoryIndex: Int!
    
    var isCellSelected: Bool = false {
        didSet{
            setConfiguration()
        }
    }
    
    private lazy var titleBtn: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = false
        return button
    }()
    
    override func hierarchy() {
        baseView.addSubview(titleBtn)
    }
    
    override func layout() {
        titleBtn.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func setConfiguration(){
        let attributes = isCellSelected ? CategoryAttribute.selectState : CategoryAttribute.deselectState
        titleBtn.configuration = CategoryCollectionViewCell.configuration(index: categoryIndex, attribute: attributes)
    }
    
    private static func configuration(index: Int, attribute: CategoryTagAttribute) -> UIButton.Configuration{
        let genreTitle = TicketMapping.genre(index: index)
        var configuration = attribute.configuration
        configuration.attributedTitle = AttributedString(genreTitle, attributes: attribute.titleAttributes)
        return configuration
    }
    
    static func getSize(index: Int) -> CGSize{
        
        func intrinsicWidth(attribute: CategoryTagAttribute) -> CGFloat{
            let configuration = CategoryCollectionViewCell.configuration(index: index, attribute: attribute)
            let button = UIButton(configuration: configuration)
            return button.intrinsicContentSize.width
        }
        
        let deselectWidth = intrinsicWidth(attribute: CategoryAttribute.deselectState)
        let selectWidth = intrinsicWidth(attribute: CategoryAttribute.selectState)
        
        return CGSize(width: max(deselectWidth, selectWidth), height: 32)
    }
}

//MARK: CategoryTagAttribute implement
private extension CategoryTagAttribute{
    static var cornerAttribute: UIButton.Configuration.CornerStyle{
        .capsule
    }
    static var insets: NSDirectionalEdgeInsets{
        NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 8, trailing: 12)
    }
}

private struct CategorySelectedAttribute: CategoryTagAttribute{
    
    let configuration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .black
        configuration.cornerStyle = cornerAttribute
        configuration.contentInsets = insets
        return configuration
    }()
    
    let titleAttributes: AttributeContainer = {
        var container = AttributeContainer()
        container.font = Typo.appleFont(type: .Bold, size: 14)
        container.foregroundColor = .white
        return container
    }()
}

private struct CategoryDeselectedAttribute: CategoryTagAttribute{
    
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
