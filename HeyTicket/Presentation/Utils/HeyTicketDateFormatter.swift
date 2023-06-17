//
//  HeyTicketDateFormatter.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/07.
//

import Foundation

struct HeyTicketDateFormatter{
    
    static let dashFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    static func remainDate(start startDate: String) -> Int {
        
//        let myDateComponents = DateComponents(year: 2022, month: 3, day: 01)
//        let startDate = Calendar.current.date(from: myDateComponents)!
//        Calendar.current.date
//
//        let offsetComps = Calendar.current.dateComponents([.day], from: dashFormatter.date(from: startDate)!, to: Date())
//        return offsetComps.day ?? 0
        
        let startDate = dashFormatter.date(from: startDate)!
        let diffBetweenDates = startDate.timeIntervalSince(Date())
        let diff = Int(diffBetweenDates / (60 * 60 * 24))
        return diff + 1
    }
    
    static func monthDateDay(data: String) -> String{
        let date = dashFormatter.date(from: data)!
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "M월 d일"
        let monthDate = formatter.string(from: date)
        return "\(monthDate)(\(dayOfWeek(date: date)))"
    }
    
    private static func dayOfWeek(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEEEE"
        formatter.locale = Locale(identifier:"ko_KR")
        let dayString = formatter.string(from: date)
        return dayString
    }
}
