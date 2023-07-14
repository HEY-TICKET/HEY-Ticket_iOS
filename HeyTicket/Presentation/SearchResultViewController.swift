//
//  SearchResultViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/07/08.
//

import Foundation
import UIKit

class SearchResultViewController: BaseViewController<SearchHeaderView, SearchResultView>{
    
    init(keyword: String){
        super.init(headerView: SearchHeaderView(keyword: keyword), mainView: SearchResultView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        setTableViewDelegate()
        setCollectionViewDelegate()
        mainView.resultView.isHidden = true
    }
    
    private func setCollectionViewDelegate(){
        mainView.tabCollectionView.delegate = self
        mainView.tabCollectionView.dataSource = self
    }
    
    private func setTableViewDelegate(){
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
    }
    
}

extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: TicketTabCollectionViewCell.self)
        cell.title = "공연"
        return cell
    }
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MoreTicketTableViewCell.self)
        return cell
    }
}
