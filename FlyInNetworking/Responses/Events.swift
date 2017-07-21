//
//  Events.swift
//  FlyInNetworking
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Foundation

public struct Events: Codable {
    
    let events: [Event]
    
}

extension Events: RawValueDecodable {
    
    init(_ rawValue: RawEvents) throws {
        events = try rawValue.items.flatMap(Event.init)
    }
    
}
