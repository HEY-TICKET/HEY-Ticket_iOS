//
//  HomeTabViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/01.
//

import UIKit
import HeyTicketKit

class HomeViewController: BaseViewController<TabBarHeaderView, TableOnlyView>{
 
    var coordinator: HomeCoordinator?
    
    init() {
        super.init(
            headerView: HomeHeaderView(),
            mainView: TableOnlyView()
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        mainView.registerCellTypes([HomeRecommendBannerTableViewCell.self])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:     return getRecommendBannerTableViewCell(indexPath: indexPath)
        default:    return BaseTableViewCell()
        }
    }
    
    private func getRecommendBannerTableViewCell(indexPath: IndexPath) -> BaseTableViewCell{
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: HomeRecommendBannerTableViewCell.self)
    }
    
    
}
