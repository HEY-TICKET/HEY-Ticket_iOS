//
//  UIStackView+extension.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit

extension UIStackView{
    func addArrangedSubviews(_ views: [UIView]){
        views.forEach{
            addArrangedSubview($0)
        }
    }
}
