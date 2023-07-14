//
//  SearchView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/07/08.
//

import HeyTicketKit
import UIKit

class SearchView: BaseView{
    
    let recentSearchField: UIView = UIView()
    
    private let recentSearchTitleFrame: UIView = UIView()
    private let recentSearchTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 검색어"
        label.font = Typo.font(type: .SemiBold, size: 14)
        return label
    }()
    
    let deleteButton: UIButton = {
        var attributedTitle = AttributedString("전체 삭제")
        attributedTitle.font = Typo.font(type: .SemiBold, size: 14)
        attributedTitle.foregroundColor = Color.grey400
        
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = attributedTitle
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return UIButton(configuration: configuration)
    }()
    
    let keywordCollectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(cellType: ChipCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func hierarchy() {
        addSubview(recentSearchField)
        recentSearchField.addSubviews([recentSearchTitleFrame, keywordCollectionView])
        recentSearchTitleFrame.addSubviews([recentSearchTitleLabel, deleteButton])
    }
    
    override func layout() {
        recentSearchField.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
        }
        recentSearchTitleFrame.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
        }
        recentSearchTitleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.bottom.equalToSuperview().inset(12)
        }
        deleteButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
        keywordCollectionView.snp.makeConstraints{
            $0.top.equalTo(recentSearchTitleFrame.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(32)
            $0.bottom.equalToSuperview()
        }
    }
    
}
