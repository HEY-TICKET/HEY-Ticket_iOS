//
//  TicketMapping.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/06.
//

import Foundation

struct TicketMapping{
    
    static let genre: [TicketGenre:String] = [
        .THEATER = "연극",
        .MUSICAL = "뮤지컬",
        .CLASSIC = "클래식",
        .KOREAN_TRADITIONAL_MUSIC = "국악",
        .POPULAR_MUSIC = "대중음악",
        .DANCE = "무용(서양/한국무용)",
        .POPULAR_DANCE = "대중무용",
        .CIRCUS_AND_MAGIC = "서커스/마술",
        .MIXED_GENRE = "아동",
        .ALL = "전체"
    ]
    
    static let state: [TicketState:String] = [
        .ONGOING = "공연 중",
        .COMPLETED = "종료"
    ]
    
}
