//
//  CategorySelectTableViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit

class CategorySelectTableViewCell: BaseTableViewCell{
    
    let collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.collectionViewLayout = flowLayout
        collectionView.register(cellType: CategoryCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func hierarchy() {
        baseView.addSubview(collectionView)
    }
    override func layout() {
        collectionView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
