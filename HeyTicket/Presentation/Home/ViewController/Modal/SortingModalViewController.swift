//
//  SortingModalViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/14.
//

import HeyTicketKit
import UIKit
import RxSwift
import RxCocoa

enum SortingState: String{
    case month = "월간"
    case week = "주간"
    case date = "일간"
    case recent = "최근 등록순"
    case reservation = "예매율순"
    case viewCount = "조회수순"
}

class SortingModalViewController: BaseModalViewController<TableOnlyView, SortingModalBottomView>{
    
    enum SortType{
        case new
        case `default`
    }
    
    let filterRelay: BehaviorRelay = BehaviorRelay(value: 0)
    
    private let sortCases: [SortingState]
    
    init(type: SortType){
        self.sortCases = type.sortCases
        super.init(detent: 281, title: "정렬", mainView: TableOnlyView(), bottomView: SortingModalBottomView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var tempState: Int!
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tempState = filterRelay.value
    }
    
    override func initialize() {
        registerTableViewCell()
        setTableViewDelegate()
        bindCTAButton()
    }
    
    private func setTableViewDelegate(){
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
    }
    
    private func registerTableViewCell(){
        mainView.tableView.registers(cellTypes: [SortingModalTableViewCell.self])
    }
    
    private func bindCTAButton(){
        bottomView.ctaButton.rx.tap
            .do{ [weak self] _ in
                self?.dismiss(animated: true)
            }
            .subscribe{ [weak self] _ in
                if let tempState = self?.tempState{
                    self?.filterRelay.accept(tempState)
                }
            }.disposed(by: disposeBag)
    }
}

extension SortingModalViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SortingModalTableViewCell.self)
        cell.isCellSelected = filterRelay.value == indexPath.row
        cell.title = sortCases[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        changeCellState(indexPath: [indexPath.section, tempState], isSelect: false)
        changeCellState(indexPath: indexPath, isSelect: true)
        tempState = indexPath.row
    }
    
    private func changeCellState(indexPath: IndexPath, isSelect: Bool){
        let cell = mainView.tableView.cellForRow(at: indexPath, cellType: SortingModalTableViewCell.self)
        cell?.isCellSelected = isSelect
    }

}

extension SortingModalViewController.SortType{
    
    var sortCases: [SortingState]{
        switch self {
        case .new:          return  [SortingState.date, SortingState.week, SortingState.month]
        case .default:      return  [SortingState.recent, SortingState.reservation, SortingState.viewCount]
        }
    }
}
