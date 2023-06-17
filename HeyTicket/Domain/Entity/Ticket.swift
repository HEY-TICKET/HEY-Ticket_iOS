//
//  Ticket.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/06.
//

import Foundation

enum TicketGenre: String, CaseIterable{
    case ALL
    case THEATER
    case MUSICAL
    case CLASSIC
    case KOREAN_TRADITIONAL_MUSIC
    case POPULAR_MUSIC
    case DANCE
    case POPULAR_DANCE
    case CIRCUS_AND_MAGIC
    case MIXED_GENRE
}

@frozen
enum TicketState: String{
    case UPCOMING
    case ONGOING
    case COMPLETED
}

struct Ticket{
    let id: String
    let title: String
    let startDate: String
    let endDate: String
    let theater: String
    let cast: String
    let crew: String
    let runtime: String
    let age: String
    let company: String
    let price: String
    let poster: URL
    let story: String
    let genre: TicketGenre
    let status: TicketState
    let openRun: Bool
    let storyUrls: [URL]
    let schedule: String
    let views: Int
}

