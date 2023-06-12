//
//  MoreTicketViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/08.
//

import Foundation
import HeyTicketKit
import UIKit

protocol FilteringDelegate: AnyObject{
    
}

class MoreTicketViewController: BaseViewController<NavigationHeaderView.TitleType, MoreTicketView>{
    
    init(){ //TODO: Title 설정
        super.init(headerView: NavigationHeaderView.generate(title: "테스트"), mainView: MoreTicketView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        setTableViewDelegate()
        setGestureRecognizer()
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
        //TODO: 필터링 바텀시트 보여주기
//        let modal = BaseModalViewController(detent: 280, mainView: BaseView())
//        present(modal, animated: true)
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
