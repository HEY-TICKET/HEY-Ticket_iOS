//
//  BaseView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/05/30.
//

import Foundation
import UIKit

class BaseView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func hierarchy() { }
    func layout() { }
}
