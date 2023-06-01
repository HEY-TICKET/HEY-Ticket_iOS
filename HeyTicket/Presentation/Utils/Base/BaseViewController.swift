//
//  BaseViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/05/30.
//

import Foundation
import UIKit
import RxSwift
import HeyTicketKit

class BaseViewController<T: BaseHeaderView, P: BaseView>: UIViewController{
    
    let headerView: T
    let mainView: P
    
    init(headerView: T, mainView: P) {
        self.headerView = headerView
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        template()
        style()
        initialize()
        bind()
    }
    
    final private func template(){
        setViewControllerStyle()
        layout()
        setHeaderViewTarget()
    }
    
    final private func layout() {
        view.addSubview(headerView)
        view.addSubview(mainView)
        headerView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        mainView.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setViewControllerStyle(){
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
        setTabBarVisibility()
    }
    
    private func setTabBarVisibility(){
        if headerView is NavigationHeaderView {
            tabBarController?.tabBar.isHidden = true
        } else {
            tabBarController?.tabBar.isHidden = false
        }
    }
    
    private func setHeaderViewTarget() {
        guard let headerView = headerView as? NavigationHeaderView else { return }
        headerView.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
    }
    
    func style() { }
    func initialize() { }
    func bind() { }
    
    @objc func popViewController(){
        navigationController?.popViewController(animated: true)
    }
}
