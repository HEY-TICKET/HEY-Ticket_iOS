//
//  InterestKeywordViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/28.
//

import Foundation
import UIKit
import HeyTicketKit
import RxSwift

class InterestKeywordViewController: BaseViewController<NavigationHeaderView.ButtonType, InterestKeywordView>{
    
    init(){
        super.init(
            headerView: NavigationButtonHeaderView.generate(btnImage: Image.cancel.withTintColor(Color.grey900)),
            mainView: InterestKeywordView()
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let modal = SignUpAgreementModalViewController()
    
    override func initialize() {
        mainView.keywordEmptyView.isHidden = true
        mainView.keywordCollectionView.delegate = self
        mainView.keywordCollectionView.dataSource = self
    }
    
    override func bind() {
        mainView.buttonFrame.ctaButton.rx.tap
            .subscribe{ _ in
                self.present(self.modal, animated: true)
            }.disposed(by: disposeBag)
    }
}

extension InterestKeywordViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: InterestKeywordCancelChipCollectionViewCell.self)
        cell.title = "테스트"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return InterestKeywordCancelChipCollectionViewCell.getSize(title: "테스트", height: 32)
    }
    
}
