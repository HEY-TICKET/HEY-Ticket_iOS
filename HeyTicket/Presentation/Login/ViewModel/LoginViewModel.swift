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
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                return emailTest.evaluate(with: email)
            }
            .share()
            .asDriver(onErrorJustReturn: false)
        
        return Output(isEmailValidate: isEmailValidate)
    }
    
    
}
