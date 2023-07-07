//
//  InterestKeywordView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/28.
//

import HeyTicketKit
import UIKit

class InterestKeywordView: BaseView{
    
    private let titleFrame: TitleFrame = TitleFrame(title: "관심 키워드 등록", subtitle: "입력한 키워드의 공연이 열리면 바로 알려드려요")
    
    let keywordTextField: NoTitleTextField = NoTitleTextField(placeholder: "공연, 출연진 입력")
    
    lazy var registerButton: CTAButton = {
        let button = CTAButton(title: "등록", color: .fillDark, configuration: .height50)
        button.clipsToBounds = true
        return button
    }()
    
    let keywordCollectionView: UICollectionView = {
        let flowLayout = LeftAlignCollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(cellType: InterestKeywordCancelChipCollectionViewCell.self)
        return collectionView
    }()
    
    //MARK: EmptyView
    let keywordEmptyView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.grey150
        view.layer.cornerRadius = 8
        return view
    }()
    private let emptyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "이런 키워드를 등록할 수 있어요"
        label.textColor = Color.grey700
        label.font = Typo.font(type: .SemiBold, size: 13)
        return label
    }()
    private let ticketsExampleStackView: InformationStackView = InformationStackView(title: "공연", example: "캣츠, 아기상어, 베토벤, 맘마미아, 미스터트롯 등 ")
    private let actorsExampleStackView: InformationStackView = InformationStackView(title: "출연진", example: "김윤아, 아이유, 박효신, 이은결, 최현우, 국립발레단 등 ")
    
    let buttonFrame: CTAButtonFrame = {
        let frame = CTAButtonFrame(ctaButton: CTAButton(title: "다음", color: .fillDark, configuration: .height50))
        frame.ctaButton.isEnabled = true
        return frame
    }()
                                                
    override func hierarchy() {
        setCollectionViewEmptyView()
        addSubviews([titleFrame, keywordTextField, registerButton, keywordCollectionView, buttonFrame])
        keywordEmptyView.addSubviews([emptyTitleLabel, ticketsExampleStackView, actorsExampleStackView])
    }
    
    private func setCollectionViewEmptyView(){
        keywordCollectionView.backgroundView = keywordEmptyView
        keywordCollectionView.backgroundView?.isHidden = false
    }
    
    override func layout() {
        titleFrame.snp.makeConstraints{
            $0.top.equalToSuperview().offset(titleFrame.topOffset)
            $0.leading.trailing.equalToSuperview()
        }
        keywordTextField.snp.makeConstraints{
            $0.top.equalTo(titleFrame.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(236)
            $0.height.equalTo(42)
        }
        registerButton.snp.makeConstraints{
            $0.top.bottom.equalTo(keywordTextField)
            $0.leading.equalTo(keywordTextField.snp.trailing).offset(8)
            $0.width.equalTo(84)
            $0.trailing.equalToSuperview().inset(16)
        }
        keywordCollectionView.snp.makeConstraints{
            $0.top.equalTo(keywordTextField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.greaterThanOrEqualTo(buttonFrame.snp.top).inset(20)
        }
        buttonFrame.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
        }
        setEmptyViewLayout()
    }
    
    private func setEmptyViewLayout(){
        keywordEmptyView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
        }
        emptyTitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        ticketsExampleStackView.snp.makeConstraints{
            $0.top.equalTo(emptyTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        actorsExampleStackView.snp.makeConstraints{
            $0.top.equalTo(ticketsExampleStackView.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(12)
        }
        ticketsExampleStackView.titleLabel.snp.makeConstraints{
            $0.width.equalTo(actorsExampleStackView.titleLabel)
        }
    }
}

private extension InterestKeywordView{
    
    class InformationStackView: UIStackView{
        
        init(title: String, example: String){
            titleLabel.text = title
            exampleLabel.text = example
            super.init(frame: .zero)
            style()
            layout()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = Typo.font(type: .Medium, size: 12)
            label.textColor = Color.grey500
            return label
        }()
        
        private let exampleLabel: UILabel = {
            let label = UILabel()
            label.font = Typo.font(type: .Regular, size: 12)
            label.textColor = Color.grey700
            return label
        }()
        
        private func style(){
            axis = .horizontal
            spacing = 8
        }
        
        private func layout(){
            addArrangedSubviews([titleLabel, exampleLabel])
        }
    }
}
