//
//  SignUpAgreementModalViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/30.
//

import Foundation
import HeyTicketKit
import UIKit

class SignUpAgreementModalViewController: BaseModalViewController<TableOnlyView, CTAButtonFrame>{
    
    var isKeywordInclude: Bool = true {
        didSet{
            detent = isKeywordInclude ? 248 : 198
        }
    }
    
    init(){
        super.init(detent: 248, title: "약관 동의", mainView: TableOnlyView(), bottomView: CTAButtonFrame(ctaButton: CTAButton(title: "가입 완료", color: .fillDark, configuration: .height50)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let agreementInformation = ["관심 키워드 등록 시 키워드 알림 수신(앱 푸시, 카카오톡 알림톡)에 동의합니다.", "회원 이용 약관과 개인정보 처리 방침을 확인하고 동의합니다."]
    
    override func initialize() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
        mainView.registerCellTypes([SignUpAgreementTableViewCell.self])
        remakeTableViewConstraints()
    }
    
    private func remakeTableViewConstraints(){
        mainView.tableView.snp.updateConstraints{
            $0.top.bottom.equalToSuperview().inset(8)
        }
    }
}

extension SignUpAgreementModalViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isKeywordInclude ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SignUpAgreementTableViewCell.self)
        cell.setInformation(agreementInformation[indexPath.row])
        return cell
    }
}
