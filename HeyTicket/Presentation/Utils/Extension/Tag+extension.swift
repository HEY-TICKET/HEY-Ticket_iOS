//
//  Tag+extension.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/10.
//

import Foundation
import UIKit
import HeyTicketKit

extension Tag{
    
    func bindingData(state: TicketState, startDate: String){
        let attributes: (title: String, configuration: TagConfiguration) = {
            switch state{
            case .UPCOMING:         return ("D-\(HeyTicketDateFormatter.remainDate(start: startDate))", Tag.blueConfiguration)
            case .ONGOING:          return ("공연 중", Tag.greenConfiguration)
            case .COMPLETED:        return ("종료", Tag.greyConfiguration)
            }
        }()
        setTagAttributes(title: attributes.title, configuration: attributes.configuration)
    }
}
