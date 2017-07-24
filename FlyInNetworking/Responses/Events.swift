//
//  Events.swift
//  FlyInNetworking
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Foundation

public struct Events: Codable {
    
    let all: [Event]
    let any: [Event]
    let monday: [Event]
    let tuesday: [Event]
    let wednesday: [Event]
    let thursday: [Event]
    let friday: [Event]
    let saturday: [Event]
    let sunday: [Event]
    
}

extension Events: RawValueDecodable {
    
    init(_ rawValue: RawEvents) throws {
        all = try rawValue.items.flatMap(Event.init)
        
        var any: [Event] = []
        var monday: [Event] = []
        var tuesday: [Event] = []
        var wednesday: [Event] = []
        var thursday: [Event] = []
        var friday: [Event] = []
        var saturday: [Event] = []
        var sunday: [Event] = []
        for event in all {
            guard let startDate = event.interval?.startDate else {
                any.append(event)
                continue
            }
            
            switch startDate.dayOfWeek {
            case .monday:
                monday.append(event)
            case .tuesday:
                tuesday.append(event)
            case .wednesday:
                wednesday.append(event)
            case .thursday:
                thursday.append(event)
            case .friday:
                friday.append(event)
            case .saturday:
                saturday.append(event)
            case .sunday:
                sunday.append(event)
            }
        }
        
        self.any = any
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
        
        assert([any, monday, tuesday, wednesday, thursday, friday, saturday, sunday].reduce(0, { $0 + $1.count }) == all.count)
    }
    
}
