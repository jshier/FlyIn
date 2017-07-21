//
//  Response.swift
//  FlyInNetworking
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Foundation

public struct Response: Codable {
    
    let events: Events
    
}

extension Response: RawValueDecodable {
    
    init(_ rawValue: RawResponse) throws {
        events = try Events(rawValue.result)
    }
    
}
