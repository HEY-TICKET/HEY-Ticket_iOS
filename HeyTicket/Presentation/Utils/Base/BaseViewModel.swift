//
//  BaseViewModel.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/05.
//

import Foundation

protocol BaseViewModel{
    associatedtype Input
    associatedtype Output
    func transform(_ input: Input) -> Output
}
