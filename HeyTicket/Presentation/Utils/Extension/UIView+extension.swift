//
//  UIView+extension.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import UIKit

extension UIView{
    func addSubviews(_ views: [UIView]){
        views.forEach{
            addSubview($0)
        }
    }
}
