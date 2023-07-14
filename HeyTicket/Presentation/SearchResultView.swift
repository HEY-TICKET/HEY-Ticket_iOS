//
//  SearchResultView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/07/08.
//

import UIKit
import HeyTicketKit

class SearchResultView: BaseView{
    
    let resultView: BaseView = BaseView()
    let emptyView: BaseView = BaseView()
    
    //MARK: - Result View
    
    let tabCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(cellType: TicketTabCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let filteringSection: FilteringSection = FilteringSection(top: 16, bottom: 20, trailing: 10)
    
    private let resultStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .horizontal
        return stackView
    }()
    
    let searchKeywordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "‘재즈' 검색 결과"
        label.font = Typo.font(type: .Regular, size: 15)
        label.textColor = Color.grey800
        return label
    }()
    
    let searchResultCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1,234"
        label.font = Typo.font(type: .SemiBold, size: 15)
        label.textColor = Color.grey800
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellType: MoreTicketTableViewCell.self)
        return tableView
    }()
    
    //MARK: - Empty View
    
    private let emptyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "검색 결과가 없어요"
        label.font = Typo.font(type: .SemiBold, size: 18)
        label.textColor = Color.grey700
        return label
    }()
    
    private let emptySubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "공연명 혹은 아티스트를\n간단한 키워드로 입력하면 검색이 더 잘 돼요!"
        label.font = Typo.font(type: .Medium, size: 15)
        label.textColor = Color.grey400
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var lookAroundButton: UIButton = {
        var attributedTitle = AttributedString("다른 공연 둘러보기")
        attributedTitle.font = Typo.font(type: .Bold, size: 14)
        attributedTitle.foregroundColor = Color.grey800
        
        var configuration = UIButton.Configuration.bordered()
        configuration.attributedTitle = attributedTitle
        configuration.background.backgroundColor = .white
        
        let button = UIButton(configuration: configuration)
        button.layer.borderColor = Color.grey250.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    override func hierarchy() {
        addSubviews([resultView, emptyView])
        setResultViewHierarchy()
        setEmptyViewHierarchy()
    }
    
    override func layout() {
        setResultViewLayout()
        setEmptyViewLayout()
    }
    
    private func setResultViewHierarchy(){
        resultView.addSubviews([tabCollectionView, filteringSection, tableView])
        filteringSection.addSubview(resultStackView)
        resultStackView.addArrangedSubviews([searchKeywordTitleLabel, searchResultCountLabel])
    }
    
    private func setEmptyViewHierarchy(){
        emptyView.addSubviews([emptyTitleLabel, emptySubtitleLabel, lookAroundButton])
    }
    
    private func setResultViewLayout(){
        resultView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        tabCollectionView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(24)
        }
        filteringSection.snp.makeConstraints{
            $0.top.equalTo(tabCollectionView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        resultStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(10)
        }
        tableView.snp.makeConstraints{
            $0.top.equalTo(filteringSection.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setEmptyViewLayout(){
        emptyView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(124+56)
            $0.leading.equalToSuperview().offset(50)
            $0.centerX.equalToSuperview()
        }
        emptyTitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        emptySubtitleLabel.snp.makeConstraints{
            $0.top.equalTo(emptyTitleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        lookAroundButton.snp.makeConstraints{
            $0.top.equalTo(emptySubtitleLabel.snp.bottom).offset(32)
            $0.width.equalToSuperview().inset(52)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
}
