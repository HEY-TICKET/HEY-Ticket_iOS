//
//  NewPasswordRegisterView.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/24.
//

import Foundation

class NewPasswordRegisterView: PasswordSettingView{
    override func style() {
        titleFrame.set(title: "새 비밀번호를 입력해 주세요", subtitle: "새로 사용하실 비밀번호를 입력해 주세요.\n(이전에 사용하던 비밀번호는 사용할 수 없어요)")
    }
}
