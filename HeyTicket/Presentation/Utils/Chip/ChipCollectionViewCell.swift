//
//  ChipCollectionViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/26.
//

import Foundation
import HeyTicketKit
import UIKit

protocol ChipAttribute{
    var configuration: UIButton.Configuration { get }
    var titleAttributes: AttributeContainer { get }
}

extension ChipAttribute{
    static var cornerAttribute: UIButton.Configuration.CornerStyle{
        .capsule
    }
}

class ChipCollectionViewCell: BaseCollectionViewCell{
    
    var title: String!
    
    var isCellSelected: Bool = false {
        didSet{
            titleBtn.isSelected = isCellSelected
            setNeedsUpdateConfiguration()
        }
    }
    
    var selectedAttribute: ChipAttribute = ChipSelectedAttribute()
    var deselectedAttribute: ChipAttribute = ChipDeselectedAttribute()

    lazy var titleBtn: UIButton = {
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
    
    override func initialize() {
        titleBtn.configurationUpdateHandler = { button in
            let attributes = {
                switch button.state{
                case .selected:     return self.selectedAttribute
                default:            return self.deselectedAttribute
                }
            }()
            self.titleBtn.configuration = ChipCollectionViewCell.configuration(title: self.title, attribute: attributes)
        }
    }
    
    private static func configuration(title: String, attribute: ChipAttribute) -> UIButton.Configuration{
        var configuration = attribute.configuration
        configuration.attributedTitle = AttributedString(title, attributes: attribute.titleAttributes)
        return configuration
    }
    
    fileprivate func intrinsicWidth(title: String, attribute: ChipAttribute) -> CGFloat{
        let configuration = ChipCollectionViewCell.configuration(title: title, attribute: attribute)
        let button = UIButton(configuration: configuration)
        return button.intrinsicContentSize.width
    }
    
    static func getWidth(title: String, selectAttribute: ChipAttribute, deselectAttribute: ChipAttribute) -> CGFloat{
        
        func intrinsicWidth(attribute: ChipAttribute) -> CGFloat{
            let configuration = ChipCollectionViewCell.configuration(title: title, attribute: attribute)
            let button = UIButton(configuration: configuration)
            return button.intrinsicContentSize.width
        }
        
        let deselectWidth = intrinsicWidth(attribute: selectAttribute)
        let selectWidth = intrinsicWidth(attribute: deselectAttribute)
        
        return max(deselectWidth, selectWidth)
    }
    
    class func getSize(title: String, height: CGFloat = 32) -> CGSize{
        let width = getWidth(
            title: title,
            selectAttribute: ChipSelectedAttribute(),
            deselectAttribute: ChipDeselectedAttribute()
        )
        return CGSize(width: width, height: height)
    }
}

private extension ChipAttribute{
    static var insets: NSDirectionalEdgeInsets{
        NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 8, trailing: 12)
    }
}

private struct ChipSelectedAttribute: ChipAttribute{
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

private struct ChipDeselectedAttribute: ChipAttribute{
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
