//
//  EmailCertificationViewModel.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol EmailCertificationViewModelInterface: BaseViewModel{
    var timeoutSubject: PublishRelay<String> { get }
}

class EmailCertificationViewModel: EmailCertificationViewModelInterface{
    
    let timeoutSubject: PublishRelay<String> = PublishRelay()
    
    private var certificationCode: String
    
    init(code: String = "123"){
        self.certificationCode = code
    }
    
    struct Input{
        let code: Observable<String>
        let willResendCode: ControlEvent<Void>
    }
    
    struct Output{
        let isCodeValid: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        
        let isCodeValid = input.code
            .filter{ !$0.isEmpty }
            .map{ code in
                self.certificationCode == code
            }.asDriver(onErrorJustReturn: false)
        
//        input.resendCode
//            .subscribe{
//                self.certificationCode =
//            }.disposed(by: DisposeBag)
        
        
        var leftSecond = 60 * 10
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            //남은 시간(초)에서 1초 빼기
            leftSecond -= 1
            //남은 분
            let minutes: Int = leftSecond / 60
            //그러고도 남은 초
            let seconds: Int = leftSecond % 60

            //남은 시간(초)가 0보다 크면
            self.timeoutSubject.accept("유효시간 \(minutes.twoDigit):\(seconds.twoDigit)")
            
            if leftSecond == 0{
                t.invalidate()
            }
        })
        
        return Output(isCodeValid: isCodeValid)
    }
}

private extension Int{
    var twoDigit: String{
        self < 10 ? "0\(self)" : "\(self)"
    }
}
