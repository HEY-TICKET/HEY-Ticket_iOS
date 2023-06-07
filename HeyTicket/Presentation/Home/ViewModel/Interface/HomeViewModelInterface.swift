//
//  HomeViewModelInterface.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import Foundation

protocol TicketRankingInterface{
    var ticketRankings: [Ticket] { get }
}

protocol NewTicketInterface{
    var newTickets: [Ticket] { get }
}


protocol HomeViewModelInterface: BaseViewModel, TicketRankingInterface, NewTicketInterface{
    var willRecommendShow: Bool { get }
}
