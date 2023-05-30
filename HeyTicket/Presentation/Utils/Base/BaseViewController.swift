//
//  BaseViewController.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/05/30.
//

import Foundation
import UIKit
import RxSwift

class BaseViewController<T: BaseView, P: BaseView>: UIViewController{
    
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
        layout()
        initialize()
        bind()
    }
    
    final private func template(){
        setViewControllerStyle()
    }
    
    private func setViewControllerStyle(){
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
        tabBarController?.tabBar.isHidden = true
    }
    
    func style() { }
    func layout() { }
    func initialize() { }
    func bind() { }
}
