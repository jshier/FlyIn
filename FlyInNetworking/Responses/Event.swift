//
//  Event.swift
//  FlyInNetworking
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Foundation

public struct Event: Codable {
    
    public let locations: [Location]
    public let title: String
    public let rawDescription: String
    public let interval: EventInterval?
    
}

extension Event: RawValueDecodable {
    
    init(_ rawValue: RawEvent) throws {
        locations = rawValue.locs.flatMap(Location.init)
        title = rawValue.title
        rawDescription = rawValue.html
        interval = EventInterval(startDate: rawValue.sTime, endDate: rawValue.eTime)
    }
    
}

public struct EventInterval: Codable {
    
    let startDate: Date
    let endDate: Date
    
}

extension EventInterval {
    
    init?(startDate: Double?, endDate: Double?) {
        guard let startDate = startDate, let endDate = endDate else { return nil }
        
        self.startDate = Date(timeIntervalSince1970: startDate)
        self.endDate = Date(timeIntervalSince1970: endDate)
    }
    
}

extension Calendar {
    
    static let gregorian = Calendar(identifier: .gregorian)
    
}

extension Date {
    
    var dayOfWeek: DayOfWeek {
        return DayOfWeek(rawValue: Calendar.gregorian.component(.weekday, from: self))!
    }
    
}

enum DayOfWeek: Int {
    
    case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
    
}
