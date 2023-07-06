//
//  InterestCategoryViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/26.
//

import Foundation
import HeyTicketKit
import UIKit
import RxSwift

class InterestCategoryViewController: BaseViewController<NavigationHeaderView.ButtonType, InterestCategoryView>{
    
    @frozen
    enum InterestType: Int{
        case area = 100
        case genre = 200
    }
    
    init(){
        super.init(
            headerView: NavigationButtonHeaderView.generate(btnImage: Image.cancel.withTintColor(Color.grey900)),
            mainView: InterestCategoryView()
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var areaInterest = [Bool](repeating: false, count: InterestType.area.dataCount)
    private var genreInterest = [Bool](repeating: false, count: InterestType.genre.dataCount)
    
    override func initialize() {
        setDelegate(mainView.areaCollectionView)
        setDelegate(mainView.genreCollectionView)
        setCollectionViewTag()
    }
    
    private func setDelegate(_ collectionView: UICollectionView){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setCollectionViewTag(){
        mainView.areaCollectionView.tag = InterestType.area.rawValue
        mainView.genreCollectionView.tag = InterestType.genre.rawValue
    }
}

private extension InterestCategoryViewController.InterestType{
    var dataCount: Int{
        switch self {
        case .area:         return TicketMapping.areas.count
        case .genre:        return TicketMapping.genres.count
        }
    }
    
    func title(index: Int) -> String{
        switch self {
        case .area:         return TicketMapping.area(index: index)
        case .genre:        return TicketMapping.genre(index: index)
        }
    }
}

extension InterestCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    private func interestType(collectionViewTag tag: Int) -> InterestType{
        return InterestType(rawValue: tag)!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        interestType(collectionViewTag: collectionView.tag).dataCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: InterestChipCollectionViewCell.self)
        cell.title = interestType(collectionViewTag: collectionView.tag).title(index: indexPath.row)
        cell.isCellSelected = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath, cellType: InterestChipCollectionViewCell.self) else { return }
        cell.isCellSelected.toggle()
        
        switch interestType(collectionViewTag: collectionView.tag){
        case .area:     areaInterest[indexPath.row] = cell.isCellSelected
        case .genre:    genreInterest[indexPath.row] = cell.isCellSelected
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = interestType(collectionViewTag: collectionView.tag).title(index: indexPath.row)
        return InterestChipCollectionViewCell.getSize(title: title)
    }
}
