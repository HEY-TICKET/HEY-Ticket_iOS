//
//  HomeRecommendBannerTableViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit
import HeyTicketKit
import SnapKit
import RxSwift
import RxCocoa

protocol RecommendBannerDelegate: AnyObject{
    func willMoveForRecommend()
}

class HomeRecommendBannerTableViewCell: BaseTableViewCell{
    
    weak var delegate: RecommendBannerDelegate?
    
    //recommend 영역
    private let recommendField: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(250)
        view.layer.cornerRadius = 16
        return view
    }()
    
    //설명 레이블
    private let explainLableStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        return stackView
    }()
    private let topExplainLabel: UILabel = {
        let label = UILabel()
        label.text = "관심 있는 정보 설정하고"
        label.textColor = Color.grey500
        label.setTypo(Typo.font(type: .Medium, size: 14))
        return label
    }()
    private let bottomExplainLabel: UILabel = {
        let label = UILabel()
        label.text = "공연 추천 받아보세요"
        label.textColor = Color.grey700
        label.setTypo(Typo.font(type: .Bold, size: 18))
        return label
    }()
    
    private let disposeBag = DisposeBag()
    
    //추천 버튼
    private lazy var recommendBtn: UIButton = {
        
        var attributedString = AttributedString("공연 추천 받기")
        attributedString.foregroundColor = .white
        attributedString.font = Typo.font(type: .Bold, size: 14)

        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = attributedString
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        configuration.baseBackgroundColor = .black
        configuration.cornerStyle = .capsule
        
        return UIButton(configuration: configuration)
    }()
    
    override func hierarchy() {
        baseView
            .addSubview(recommendField)
        
        recommendField
            .addSubviews(
                [explainLableStackView, recommendBtn]
            )
        
        explainLableStackView
            .addArrangedSubviews(
                [topExplainLabel, bottomExplainLabel]
            )
    }
    
    override func layout() {
        
        recommendField.snp.makeConstraints{
            $0.top.leading.equalToSuperview().offset(16)
            $0.centerX.centerY.equalToSuperview()
        }
        
        explainLableStackView.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview().inset(20)
        }
        
        recommendBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(26)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(33)
        }
    }
    
    override func initialize() {
        addRecommendBtnTarget()
    }
    
    private func addRecommendBtnTarget(){
        recommendBtn.rx.tap
            .subscribe{ [weak self] _ in
                self?.delegate?.willMoveForRecommend()
            }.disposed(by: disposeBag)
    }
}
