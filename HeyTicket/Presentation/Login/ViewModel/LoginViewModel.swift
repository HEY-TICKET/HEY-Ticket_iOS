//
//  LoginViewModel.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/17.
//

import Foundation
import RxSwift
import RxCocoa

protocol LoginViewModelInterface: BaseViewModel{
    
}

class LoginViewModel: LoginViewModelInterface{
    
    struct Input{
        let email: Observable<String>
    }

    struct Output{
        let isEmailValidate: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        
        let isEmailValidate = input.email
            .filter{
                !$0.isEmpty
            }
            .map{ email in
                Regex.evaluate(expression: .email, target: email)
            }
            .share()
            .asDriver(onErrorJustReturn: false)
        
        return Output(isEmailValidate: isEmailValidate)
    }
    
    
}
