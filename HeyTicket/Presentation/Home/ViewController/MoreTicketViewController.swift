//
//  MoreTicketViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/08.
//

import Foundation
import HeyTicketKit
import UIKit

class MoreTicketViewController: BaseViewController<NavigationHeaderView.TitleType, MoreTicketView>{
    
    private let sortingModalVC: SortingModalViewController
    private let sortCases: [SortingState]
    
    init(isNew: Bool){ //TODO: Title 설정
        let sortType: SortingModalViewController.SortType = isNew ? .new : .default
        sortingModalVC = SortingModalViewController(type: sortType)
        self.sortCases = sortType.sortCases
        super.init(headerView: NavigationHeaderView.generate(title: "테스트"), mainView: MoreTicketView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        setTableViewDelegate()
        setGestureRecognizer()
    }
    
    override func bind() {
        sortingModalVC.filterRelay
            .subscribe{ [weak self] in
                if let title = self?.sortCases[$0].rawValue {
                    self?.mainView.filteringSection.title = title
                }
            }.disposed(by: disposeBag)
    }
    
    private func setTableViewDelegate(){
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
    }
    
    private func setGestureRecognizer(){
        mainView.filteringSection.interactionSection.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showFilteringBottomSheet)))
    }
    
    @objc private func showFilteringBottomSheet(){
        present(sortingModalVC, animated: true)
    }
}
 
extension MoreTicketViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MoreRankingTicketTableViewCell.self)
        cell.bindingData(HomeTicketCollectionViewCell.TestData, ranking: indexPath.row+1)
        return cell
    }
}
