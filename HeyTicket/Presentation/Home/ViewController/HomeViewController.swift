//
//  HomeTabViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/01.
//

import UIKit
import HeyTicketKit
import RxCocoa

class HomeViewController: BaseViewController<TabBarHeaderView, TableOnlyView>{
    
    enum TicketViewTag: Int{
        case `default` = 0
        //추천 섹션
        case recommendItem = 1
        //랭킹 섹션
        case rankingItem = 101
        case rankingCategory = 110
        //새로운 섹션
        case newItem = 201
        case newCategory = 210
    }
 
    var coordinator: HomeCoordinator?
    
    private let viewModel: any HomeViewModelInterface
    
    init(viewModel: any HomeViewModelInterface) {
        self.viewModel = viewModel
        super.init(headerView: HomeHeaderView(), mainView: TableOnlyView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let SECTION_OF_RECOMMEND: Int = 0
    private let SECTION_OF_RANKING: Int = 1
    private let SECTION_WITH_CATEGORY_SELECT: Int = 2
    private let SECTION_WITHOUT_CATEGORY_SELECT: Int = 0
    
    private let INDEX_OF_CATGORY: Int = 1
    
    private let rankingCategoryRelay: BehaviorRelay = BehaviorRelay(value: 0)
    private let newCategoryRelay: BehaviorRelay = BehaviorRelay(value: 0)
    
    override func initialize() {
        setTableViewDelegate()
        registerTableViewCell()
    }
    
    private func setTableViewDelegate(){
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
    }
    
    private func registerTableViewCell(){
        mainView.registerCellTypes(
            [HomeRecommendBannerTableViewCell.self,
             CategorySelectTableViewCell.self,
             SectionTitleTableViewCell.self,
             SectionTitleWithMoreFlowTableViewCell.self,
             TicketListTableViewCell.self
            ]
        )
    }
}

extension HomeViewController: RecommendBannerDelegate, MoreSectionItemDelegate{
    
    func willMoveForRecommend() {
        //TODO: 유저 미로그인
        
        //TODO: 관심정보 설정X
    }
    
    func willMoveMoreItemViewController() {
        coordinator?.showMoreItems(isNew: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1 + SECTION_WITHOUT_CATEGORY_SELECT + SECTION_WITH_CATEGORY_SELECT
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case SECTION_OF_RECOMMEND:
            return viewModel.willRecommendShow ? 2 : 1
        case ...SECTION_WITH_CATEGORY_SELECT:
            return 3
        case ...(SECTION_WITH_CATEGORY_SELECT+SECTION_WITHOUT_CATEGORY_SELECT):
            return 2
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case SECTION_OF_RECOMMEND:
            return cellOfRecommendSection(indexPath: indexPath)
        case ...SECTION_WITH_CATEGORY_SELECT:
            return cellOfTicketWithCategorySection(indexPath: indexPath)
        case ...(SECTION_WITH_CATEGORY_SELECT+SECTION_WITHOUT_CATEGORY_SELECT):
            return cellOfTicketSection(indexPath: indexPath)
        default:
            fatalError()
        }
    }
    
    //Section
    private func cellOfRecommendSection(indexPath: IndexPath) -> BaseTableViewCell{
        if !viewModel.willRecommendShow {
            return cellOfRecommendBanner(indexPath: indexPath)
        }
        switch indexPath.row{
        case 0:     return cellOfTicket(title: "나를 위한 공연", indexPath: indexPath)
        default:    return cellOfTicketList(indexPath: indexPath, tag: .recommendItem)
        }
    }
    
    private func cellOfTicketWithCategorySection(indexPath: IndexPath) -> BaseTableViewCell{
        
        let info: (title: String, category: TicketViewTag, item: TicketViewTag)
        if indexPath.section == SECTION_OF_RANKING {
            info = ("공연 랭킹", .rankingCategory, .rankingItem)
        } else {
            info = ("새로 나온 공연", .newCategory, .newItem)
        }
        
        switch indexPath.row{
        case 0:     return cellOfTicketWithMore(title: info.title, indexPath: indexPath)
        case 1:     return cellOfTicketCategory(indexPath: indexPath, tag: info.category)
        case 2:     return cellOfTicketList(indexPath: indexPath, tag: info.item)
        default:    fatalError()
        }
    }
    
    private func cellOfTicketSection(indexPath: IndexPath) -> BaseTableViewCell{
        switch indexPath.row{
        case 0:     return cellOfTicketWithMore(title: "테스트", indexPath: indexPath)
        case 1:     return cellOfTicketList(indexPath: indexPath, tag: .default)
        default:    fatalError()
        }
    }
    
    //TableViewCell
    private func cellOfRecommendBanner(indexPath: IndexPath) -> BaseTableViewCell{
        let cell = mainView.tableView.dequeueReusableCell(for: indexPath, cellType: HomeRecommendBannerTableViewCell.self)
        cell.delegate = self
        return cell
    }
    
    private func cellOfTicket(title: String, indexPath: IndexPath) -> BaseTableViewCell{
        let cell = mainView.tableView.dequeueReusableCell(for: indexPath, cellType: SectionTitleTableViewCell.self)
        cell.title = title
        return cell
    }
    
    private func cellOfTicketWithMore(title: String, indexPath: IndexPath) -> BaseTableViewCell{
        let cell = mainView.tableView.dequeueReusableCell(for: indexPath, cellType: SectionTitleWithMoreFlowTableViewCell.self)
        cell.title = title
        cell.delegate = self
        return cell
    }
    
    private func cellOfTicketCategory(indexPath: IndexPath, tag: TicketViewTag) -> BaseTableViewCell{
        let cell = mainView.tableView.dequeueReusableCell(for: indexPath, cellType: CategorySelectTableViewCell.self)
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.tag = tag.rawValue
        return cell
    }
    
    private func cellOfTicketList(indexPath: IndexPath, tag: TicketViewTag) -> BaseTableViewCell{
        let cell = mainView.tableView.dequeueReusableCell(for: indexPath, cellType: TicketListTableViewCell.self)
        cell.sectionType = ticketListType(of: indexPath)
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.tag = tag.rawValue
        return cell
    }
    
    private func ticketListType(of indexPath: IndexPath) -> TicketListTableViewCell.ShowListType{
        indexPath.section == SECTION_OF_RECOMMEND ? .recommend : .default
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch TicketViewTag(rawValue: collectionView.tag){
        case .recommendItem:                        return cellOfRecommendTicket(collectionView, indexPath: indexPath)
        case .rankingItem:                          return cellOfTicketWithRanking(collectionView, indexPath: indexPath)
        case .rankingCategory, .newCategory:        return cellOfCategory(collectionView, indexPath: indexPath)
        default:                                    return cellOfTicket(collectionView, indexPath: indexPath)
        }
    }
    
    private func categoryRelay(tag: Int) -> BehaviorRelay<Int>{
        switch TicketViewTag(rawValue: tag){
        case .rankingCategory:      return rankingCategoryRelay
        case .newCategory:          return newCategoryRelay
        default:                    fatalError()
        }
    }
    
    private func cellOfCategory(_ collectionView: UICollectionView, indexPath: IndexPath) -> BaseCollectionViewCell{
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CategoryCollectionViewCell.self)
        cell.categoryIndex = indexPath.row
        cell.isCellSelected = indexPath.row == categoryRelay(tag: collectionView.tag).value
        return cell
    }
    
    private func cellOfRecommendTicket(_ collectionView: UICollectionView, indexPath: IndexPath) -> BaseCollectionViewCell{
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: RecommendTicketCollectionViewCell.self)
//        cell.bindingData(Ticket(title: "영웅"))
        return cell
    }
    
    private func cellOfTicket(_ collectionView: UICollectionView, indexPath: IndexPath) -> BaseCollectionViewCell{
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: HomeTicketCollectionViewCell.self)
        cell.bindingData(HomeTicketCollectionViewCell.TestData)
        return cell
    }
    
    private func cellOfTicketWithRanking(_ collectionView: UICollectionView, indexPath: IndexPath) -> RankingTicketCollectionViewCell{
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: RankingTicketCollectionViewCell.self)
//        cell.bindingData(Ticket(title: "영웅"), ranking: indexPath.row + 1) //번개맨: 우주최강 번개삼총사 [오산]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        switch TicketViewTag(rawValue: collectionView.tag){
        case .recommendItem:                        return TicketListView.recommendViewInfo.itemSize
        case .rankingCategory, .newCategory:        return CategoryCollectionViewCell.getSize(index: indexPath.row)
        default:                                    return TicketListView.defaultViewInfo.itemSize
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let relay = categoryRelay(tag: collectionView.tag)
        
        let previousCell = collectionView.cellForItem(at: [indexPath.section, relay.value], cellType: CategoryCollectionViewCell.self)
        previousCell?.isCellSelected = false

        let cell = collectionView.cellForItem(at: indexPath, cellType: CategoryCollectionViewCell.self)
        cell?.isCellSelected = true
        relay.accept(indexPath.row)
    }
}
