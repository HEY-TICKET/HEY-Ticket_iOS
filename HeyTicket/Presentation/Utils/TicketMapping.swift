//
//  TicketMapping.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/06.
//

import Foundation

struct TicketMapping{
    
    static func genre(index: Int) -> String {
        let genre = TicketGenre.allCases[index]
        return TicketMapping.genreMapping[genre]!
    }
    
    static private let genreMapping: [TicketGenre : String] = [
        .ALL : "전체",
        .THEATER : "연극",
        .MUSICAL : "뮤지컬",
        .CLASSIC : "클래식",
        .KOREAN_TRADITIONAL_MUSIC : "국악",
        .POPULAR_MUSIC : "대중음악",
        .DANCE : "무용(서양/한국무용)",
        .POPULAR_DANCE : "대중무용",
        .CIRCUS_AND_MAGIC : "서커스/마술",
        .MIXED_GENRE : "아동",
    ]
    
    static let state: [TicketState:String] = [
        .ONGOING : "공연 중",
        .COMPLETED : "종료"
    ]
}
