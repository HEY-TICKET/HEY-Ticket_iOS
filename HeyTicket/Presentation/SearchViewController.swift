//
//  SearchViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/07/08.
//

import Foundation
import UIKit

class SearchViewController: BaseViewController<SearchHeaderView, SearchView>{
    
    init(){
        super.init(headerView: SearchHeaderView(keyword: nil), mainView: SearchView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        setCollectionViewDelegate()
    }
    
    private func setCollectionViewDelegate(){
        mainView.keywordCollectionView.delegate = self
        mainView.keywordCollectionView.dataSource = self
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ChipCollectionViewCell.self)
        cell.title = "테스트"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        ChipCollectionViewCell.getSize(title: "테스트")
    }
    
}
