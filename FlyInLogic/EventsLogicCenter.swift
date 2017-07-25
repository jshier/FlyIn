//
//  EventsLogicCenter.swift
//  FlyInLogic
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Foundation
import FlyInNetworking

public final class EventsLogicCenter {
    
    public let pages = 8
    
    private var events: Events?
    
    public init() { }
    
    public func fetchEvents(complete: @escaping (_ error: Error?) -> Void) {
        Network.shared.fetchEvents { result in
            result.withValue { events in
                self.events = events
            }.withError(complete)
        }
    }
    
    public func center(for page: Page) -> PageLogicCenter? {
        guard let events = events else { return nil }
        
        return PageLogicCenter(events.events(for: page))
    }
    
}

extension Events {
    
    func events(for page: Page) -> [Event] {
        switch page {
        case .any: return any
        case .monday: return monday
        case .tuesday: return tuesday
        case .wednesday: return wednesday
        case .thursday: return thursday
        case .friday: return friday
        case .saturday: return saturday
        case .sunday: return sunday
        }
    }
    
}

public enum Page: Int {
    case any = 0, monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

public struct PageLogicCenter {
    
    let events: [Event]
    
    init(_ events: [Event]) {
        self.events = events
    }
    
}

