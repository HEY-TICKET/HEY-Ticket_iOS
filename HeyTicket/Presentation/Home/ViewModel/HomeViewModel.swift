//
//  HomeViewModel.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/04.
//

import Foundation

class HomeViewModel: HomeViewModelInterface{
    
    var willRecommendShow: Bool = false
    var ticketRankings: [Ticket] = [Ticket]()
    var newTickets: [Ticket] = [Ticket]()
    
//    private let getRankingShowsUseCaseInterface
//    private let getNewShowsUseCaseInterface
    
    init(){
        
    }
    
    struct Input{
        
    }
    
    struct Output{
        
    }
    
    func transform(_ input: Input) -> Output {
        return Output()
    }
}
