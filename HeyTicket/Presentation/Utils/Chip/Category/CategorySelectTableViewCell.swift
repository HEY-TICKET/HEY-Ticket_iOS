//
//  CategorySelectTableViewCell.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit
import RxCocoa

class CategorySelectTableViewCell: BaseTableViewCell{
    
    let categorySelectRelay: BehaviorRelay = BehaviorRelay(value: 0)
    
    let collectionView: UICollectionView = { //private으로 변경하기
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.collectionViewLayout = flowLayout
        collectionView.register(cellType: CategoryCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func hierarchy() {
        baseView.addSubview(collectionView)
    }
    
    override func layout() {
        collectionView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func initialize() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CategorySelectTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        TicketMapping.genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cellOfCategory(collectionView, indexPath: indexPath)
    }
    
    private func cellOfCategory(_ collectionView: UICollectionView, indexPath: IndexPath) -> BaseCollectionViewCell{
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CategoryCollectionViewCell.self)
        cell.categoryIndex = indexPath.row
        cell.isCellSelected = indexPath.row == categorySelectRelay.value
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        func setCellState(indexPath: IndexPath, isSelect: Bool){
            let cell = collectionView.cellForItem(at: indexPath, cellType: CategoryCollectionViewCell.self)
            cell?.isCellSelected = isSelect
        }
        
        setCellState(indexPath: [indexPath.section, categorySelectRelay.value], isSelect: false)
        setCellState(indexPath: indexPath, isSelect: true)
        categorySelectRelay.accept(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CategoryCollectionViewCell.getSize(index: indexPath.row)
    }
    
}
