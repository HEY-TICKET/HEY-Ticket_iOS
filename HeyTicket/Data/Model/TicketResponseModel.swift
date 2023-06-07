//
//  TicketResponseModel.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/06.
//

import Foundation

struct TicketResponseModel: Encodable{
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
    let poster: String
    let story: String
    let genre: String
    let status: String
    let openRun: Bool
    let storyUrls: [String]
    let schedule: String
    let views: Int
}

extension TicketResponseModel{
    func toDomain() -> Ticket{
        Ticket(
            id: id,
            title: title,
            startDate: startDate,
            endDate: endDate,
            theater: theater,
            cast: cast,
            crew: crew,
            runtime: runtime,
            age: age,
            company: company,
            price: price,
            poster: URL(string: poster)!,
            story: story,
            genre: TicketGenre(rawValue: genre) ?? TicketGenre.ALL,
            status: TicketState(rawValue: status) ?? TicketState.UPCOMING,
            openRun: openRun,
            storyUrls: storyUrls.map{ URL(string: $0)! },
            schedule: schedule,
            views: views
        )
    }
}
