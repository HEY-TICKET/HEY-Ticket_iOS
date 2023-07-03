//
//  PasswordLoginViewModel.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/21.
//

import Foundation
import RxSwift
import RxCocoa

class PasswordLoginViewModel: BaseViewModel{
    
    struct Input{
        let password: Observable<String>
    }
    
    struct Output{
        let isPasswordValidate: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        
        let isPasswordValidate = input.password
            .filter{
                !$0.isEmpty
            }
            .map{ password in
                Regex.evaluate(expression: .password, target: password)
            }.asDriver(onErrorJustReturn: false)
        
        return Output(isPasswordValidate: isPasswordValidate)
    }
    
    
}
