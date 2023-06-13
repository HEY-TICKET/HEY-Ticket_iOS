//
//  HomeShowCollectionViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit
import HeyTicketKit

class HomeTicketCollectionViewCell: BaseCollectionViewCell{
    
    static let TestData = Ticket(id: "1",
                                 title: "파우스트",
                                 startDate: "2023-06-12",
                                 endDate: "2023-06-08",
                                 theater: "용산구 블루 스퀘어",
                                 cast: "",
                                 crew: "",
                                 runtime: "",
                                 age: "",
                                 company: "",
                                 price: "",
                                 poster: URL(filePath: ""),
                                 story: "",
                                 genre: .ALL,
                                 status: .ONGOING,
                                 openRun: true,
                                 storyUrls: [],
                                 schedule: "",
                                 views: 2)
    
    var posterImageHeight: CGFloat = TicketListView.defaultViewInfo.imageHeight
    
    private var ticket: Ticket!
    
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
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.blueTagText
        label.font = Typo.font(type: .SemiBold, size: 12)
        return label
    }()
    private let calendarLabel: UILabel = {
        let label = UILabel()
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
            .addArrangedSubviews([dateLabel, calendarLabel])
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
    
    func bindingData(_ data: Ticket){
        ticket = data
        setData()
        switch data.status{
        case .UPCOMING:     setUpcomingTicketAttributes()
        case .ONGOING:      setOngoingTicketAttributes()
        default:            return
        }
    }
    
    private func setData(){
        showTitleLabel.text = ticket.title
        placeLabel.text = ticket.theater
        dateLabel.text = ticket.dateBinding
        calendarLabel.text = ticket.calendarBinding
//        posterImageView.kf.setImage(<#T##CIImage#>)
    }
    
    private func setUpcomingTicketAttributes(){
        dateLabel.textColor = Color.blueTagText
    }
    
    private func setOngoingTicketAttributes(){
        dateLabel.textColor = Color.greenTagText
    }
}


private extension Ticket{
    
    var dateBinding: String?{
        switch status{
        case .UPCOMING:     return "D-\(HeyTicketDateFormatter.remainDate(start: startDate))"
        case .ONGOING:      return "공연 중"
        default:            return nil
        }
    }
    
    var calendarBinding: String?{
        switch status{
        case .UPCOMING:     return "\(HeyTicketDateFormatter.monthDateDay(data: startDate)) 시작"
        case .ONGOING:      return "\(HeyTicketDateFormatter.monthDateDay(data: endDate)) 종료"
        default:            return nil
        }
    }
}
