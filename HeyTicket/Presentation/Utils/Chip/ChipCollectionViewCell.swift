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

class ChipCollectionViewCell: BaseCollectionViewCell{
    
    var title: String!
    
    var isCellSelected: Bool = false {
        didSet{
            titleBtn.isSelected = isCellSelected
            setNeedsUpdateConfiguration()
        }
    }
    
    var selectedAttribute: ChipAttribute!
    var deselectedAttribute: ChipAttribute!

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
            self.titleBtn.configuration = ChipCollectionViewCell.configuration(title: self.title, attribute: attributes!)
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
}
