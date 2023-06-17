//
//  MoreTicketTableViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/08.
//

import UIKit
import HeyTicketKit

class MoreRankingTicketTableViewCell: MoreTicketTableViewCell, BindingTicketRanking{
    
    let rankingTag: UILabel = rankingTagLabel
    
    override func hierarchy() {
        super.hierarchy()
        posterImageView.addSubview(rankingTag)
    }
    
    override func layout() {
        super.layout()
        rankingTagLayout()
    }
    
    func bindingData(_ data: Ticket, ranking: Int) {
        rankingTag.text = "\(ranking)"
        super.bindingData(data)
    }
}

class MoreTicketTableViewCell: BaseTableViewCell{
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private let stateTag: Tag = {
        let tag = Tag()
       return tag
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "정준일 소극장 콘서트 2023 겨울"
        label.numberOfLines = 2
        label.setTypo(Typo.font(type: .Bold, size: 15))
        label.textColor = UIColor(34)
        return label
     }()
    
    private let detailStackView: UIStackView = {
        let stackView = UIStackView()
         stackView.spacing = 2
         stackView.axis = .vertical
         return stackView
    }()
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.text = "서울 종로구・드림시어터 소극장"
        label.textColor = UIColor(159)
        label.numberOfLines = 2
        label.setTypo(Typo.font(type: .Medium, size: 13))
        return label
     }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2022.12.19(수) ~ 2023.02.05(일)"
        label.textColor = UIColor(159)
        label.numberOfLines = 2
        label.setTypo(Typo.font(type: .Medium, size: 13))
        return label
     }()
    
    
    private let priceStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.spacing = 2
        stackView.axis = .vertical
        return stackView
    }()
    private let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "예매가"
        label.textColor = UIColor(186)
        label.numberOfLines = 1
        label.setTypo(Typo.font(type: .Medium, size: 11))
        return label
     }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "12,000~30,000"
        label.textColor = UIColor(51)
        label.numberOfLines = 1
        label.setTypo(Typo.font(type: .Bold, size: 15))
        return label
     }()
    
    override func hierarchy() {
        
        addSubviews([posterImageView, stateTag, titleLabel, detailStackView, priceStackView])
        
        detailStackView.addArrangedSubviews([placeLabel, dateLabel])
        priceStackView.addArrangedSubviews([priceTitleLabel, priceLabel])
    }
    
    override func layout() {
        baseView.snp.makeConstraints{
            $0.height.equalTo(152+20)
        }
        posterImageView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(108)
        }
        stateTag.snp.makeConstraints{
            $0.top.equalTo(posterImageView).offset(2)
            $0.height.equalTo(22) //임시
            $0.leading.equalTo(posterImageView.snp.trailing).offset(12)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(stateTag.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(stateTag)
        }
        detailStackView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(stateTag)
            $0.trailing.equalToSuperview().inset(16)
        }
        priceStackView.snp.makeConstraints{
            $0.top.greaterThanOrEqualTo(detailStackView.snp.bottom).offset(11)
            $0.bottom.equalTo(posterImageView).inset(2)
            $0.leading.equalTo(stateTag)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    func bindingData(_ data: Ticket){
        stateTag.bindingData(state: data.status, startDate: data.startDate)
    }
}
