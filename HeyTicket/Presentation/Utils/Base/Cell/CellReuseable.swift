//
//  CellReuseable.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import Foundation

protocol CellReuseable{
    static var cellIdentifier: String { get }
}

extension CellReuseable{
    static var cellIdentifier: String {
        String(describing: self)
    }
}
