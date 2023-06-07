//
//  ShowListTableViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit
import SnapKit

class TicketListView{
    static let recommendViewInfo = RecommendTicketListCollectionView()
    static let defaultViewInfo = DefaultTicketListCollectionView()
}

protocol TicketListCollectionViewInformation{
    var itemSize: CGSize { get }
    var itemSpacing: CGFloat { get }
    var imageHeight: CGFloat { get }
    var cellTypes: [BaseCollectionViewCell.Type] { get }
}

struct RecommendTicketListCollectionView: TicketListCollectionViewInformation{
    let itemSize: CGSize = CGSize(width: 212, height: 360.29 + 17)
    let itemSpacing: CGFloat = 16
    let imageHeight: CGFloat = 295.29
    let cellTypes: [BaseCollectionViewCell.Type] = [RecommendTicketCollectionViewCell.self]
}

struct DefaultTicketListCollectionView: TicketListCollectionViewInformation{
    let itemSize: CGSize = CGSize(width: 148, height: 294)
    let itemSpacing: CGFloat = 10
    let imageHeight: CGFloat = 210
    let cellTypes: [BaseCollectionViewCell.Type] = [RankingTicketCollectionViewCell.self, HomeTicketCollectionViewCell.self]
}

class TicketListTableViewCell: BaseTableViewCell{
    
    enum ShowListType{
        case recommend
        case `default`
    }
    
    var sectionType: ShowListType!{
        didSet{
            setFlowLayoutAttribute()
            setCollectionViewAttribute()
            collectionView.collectionViewLayout = flowLayout
        }
    }
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private static let recommendViewInfo = RecommendTicketListCollectionView()
    private static let defaultViewInfo = DefaultTicketListCollectionView()
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    private var attributes: TicketListCollectionViewInformation{
        switch sectionType {
        case .recommend:    return TicketListView.recommendViewInfo
        default:            return TicketListView.defaultViewInfo
        }
    }
    
    override func hierarchy() {
        baseView.addSubview(collectionView)
    }
    
    override func layout() {
        collectionView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(23)
        }
    }
    
    private func setFlowLayoutAttribute(){
        flowLayout.itemSize = attributes.itemSize
        flowLayout.minimumInteritemSpacing = attributes.itemSpacing
    }
    
    private func setCollectionViewAttribute(){
        collectionView.snp.makeConstraints{
            $0.height.equalTo(attributes.itemSize.height)
        }
        collectionView.registers(cellTypes: attributes.cellTypes)
    }
}
