//
//  InterestCategoryView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/26.
//

import HeyTicketKit
import UIKit

class InterestCategoryView: BaseView{
    
    private let titleFrame: TitleFrame = TitleFrame(title: "관심 카테고리 선택", subtitle: "선택한 카테고리 기준으로 공연을 추천해 드려요")

    private let areaTitleFrame: SmallTitleFrame = SmallTitleFrame(title: "지역", subtitle: "복수 선택 가능해요")
    let areaCollectionView: UICollectionView = {
        
        let flowLayout = CenterAlignCollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 12
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(cellType: InterestChipCollectionViewCell.self)
        return collectionView
    }()
    
    private let genreTitleFrame: SmallTitleFrame = SmallTitleFrame(title: "공연 장르", subtitle: "복수 선택 가능해요")
    
    let genreCollectionView: UICollectionView = {
        
        let flowLayout = CenterAlignCollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 12
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(cellType: InterestChipCollectionViewCell.self)
        return collectionView
    }()
    
    lazy var buttonFrame: CTAButtonFrame = {
        let frame = CTAButtonFrame(ctaButton: CTAButton(title: "다음", color: .fillDark, configuration: .height50))
        frame.ctaButton.isEnabled = true
        return frame
    }()
    
    override func hierarchy() {
        addSubviews([titleFrame, areaTitleFrame, areaCollectionView, genreTitleFrame, genreCollectionView, buttonFrame])
    }
    
    override func layout() {
        titleFrame.snp.makeConstraints{
            $0.top.equalToSuperview().offset(titleFrame.topOffset)
            $0.leading.trailing.equalToSuperview()
        }
        areaTitleFrame.snp.makeConstraints{
            $0.top.equalTo(titleFrame.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview()
        }
        areaCollectionView.snp.makeConstraints{
            $0.top.equalTo(areaTitleFrame.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(156)
        }
        genreTitleFrame.snp.makeConstraints{
            $0.top.equalTo(areaCollectionView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview()
        }
        genreCollectionView.snp.makeConstraints{
            $0.top.equalTo(genreTitleFrame.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(114)
        }
        buttonFrame.snp.makeConstraints{
            $0.top.greaterThanOrEqualTo(genreCollectionView.snp.bottom).offset(34)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
