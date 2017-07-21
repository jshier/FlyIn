//
//  RawResponses.swift
//  FlyInNetworking
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Foundation

struct RawLocation: Decodable {
    
    let lon: Double
    let lat: Double
    let iLName: String?
    
}

struct RawEvent: Decodable {
    
    let locs: [RawLocation]
    let sTime: Double?
    let eTime: Double?
    let title: String
    let html: String
    
}

struct RawEvents: Decodable {
    
    let items: [RawEvent]
    
}

struct RawResponse: Decodable {
    
    let result: RawEvents
    
}
