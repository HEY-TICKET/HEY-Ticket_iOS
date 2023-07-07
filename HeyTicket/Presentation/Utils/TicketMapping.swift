//
//  TicketMapping.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/06.
//

import Foundation

struct TicketMapping{
    
    //MARK: Genre
    static let genres: [TicketGenre] = TicketGenre.allCases
    
    static func genre(index: Int) -> String {
        let genre = TicketMapping.genres[index]
        return TicketMapping.genreMapping[genre]!
    }
    
    static private let genreMapping: [TicketGenre : String] = [
        .ALL: "전체",
        .THEATER: "연극",
        .MUSICAL: "뮤지컬",
        .CLASSIC: "클래식",
        .KOREAN_TRADITIONAL_MUSIC: "국악",
        .POPULAR_MUSIC: "대중음악",
        .DANCE: "무용(서양/한국무용)",
        .POPULAR_DANCE: "대중무용",
        .CIRCUS_AND_MAGIC: "서커스/마술",
        .MIXED_GENRE: "아동",
    ]
    
    //MARK: Area
    static let areas: [TicketArea] = TicketArea.allCases
    
    static func area(index: Int) -> String{
        let genre = TicketMapping.areas[index]
        return TicketMapping.areaMapping[genre]!
    }
    
    static private let areaMapping: [TicketArea: String] = [
        .SEOUL: "서울",
        .BUSAN: "부산",
        .DAEGU: "대구",
        .INCHEON: "인천",
        .GWANGJU: "광주",
        .DAEJEON: "대전",
        .ULSAN: "울산",
        .SEJONG: "세종",
        .GYEONGGI: "경기도",
        .GANGWON: "강원도",
        .CHUNGBUK: "충청북도",
        .CHUNGNAM: "충청남도",
        .JEONBUK: "전라북도",
        .JEONNAM: "전라남도",
        .GYEONGBUK: "경상북도",
        .GYEONGNAM: "경상남도",
        .JEJU: "제주특별자치도"
    ]
    
    static let state: [TicketState: String] = [
        .ONGOING : "공연 중",
        .COMPLETED : "종료"
    ]
}
