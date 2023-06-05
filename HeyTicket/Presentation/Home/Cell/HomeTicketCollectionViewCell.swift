//
//  HomeShowCollectionViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit
import HeyTicketKit

struct Show{
    let title: String
}

class HomeTicketCollectionViewCell: BaseCollectionViewCell{
    
    var posterImageHeight: CGFloat = TicketListView.defaultViewInfo.imageHeight
    
    //포스터 이미지
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.backgroundColor = Color.grey200
        return imageView
    }()
    
    //공연 타이틀 + 장소
    private let showInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    private let placeLabel: UILabel = {
       let label = UILabel()
        label.text = "용산구・블루 스퀘어"
        label.textColor = Color.grey500
        label.font = Typo.font(type: .Medium, size: 12)
        return label
    }()
    private let showTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byCharWrapping
        label.textColor = Color.grey900
        label.font = Typo.font(type: .Medium, size: 14)
        return label
    }()
    
    //공연 날짜
    private let dateStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .horizontal
        return stackView
    }()
    private let remainDateLabel: UILabel = {
        let label = UILabel()
        label.text = "D-14"
        label.textColor = Color.blueTagText
        label.font = Typo.font(type: .SemiBold, size: 12)
        return label
    }()
    private let dateInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "3월 31일(금) 시작"
        label.textAlignment = .left
        label.textColor = Color.grey500
        label.font = Typo.font(type: .Medium, size: 12)
        return label
    }()
    
    override func hierarchy() {
        baseView
            .addSubviews([posterImageView, showInfoStackView, dateStackView])
        
        showInfoStackView
            .addArrangedSubviews([placeLabel, showTitleLabel])
        
        dateStackView
            .addArrangedSubviews([remainDateLabel, dateInfoLabel])
    }
    
    override func layout() {
        posterImageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(posterImageHeight)
        }
        showInfoStackView.snp.makeConstraints{
            $0.top.equalTo(posterImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
        dateStackView.snp.makeConstraints{
            $0.top.equalTo(showInfoStackView.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.trailing.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    func bindingData(_ data: Show){
        showTitleLabel.text = data.title
    }
}
