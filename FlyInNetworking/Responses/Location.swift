//
//  Location.swift
//  FlyInNetworking
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import CoreLocation
import Foundation

public struct Location: Codable {
    
    public let coordinate: CLLocationCoordinate2D
    public let name: String?
    
}

extension Location: RawValueDecodable {
    
    init(_ rawValue: RawLocation) {
        coordinate = CLLocationCoordinate2D(latitude: rawValue.lat, longitude: rawValue.lon)
        name = rawValue.iLName
    }
    
}

protocol RawValueDecodable {
    
    associatedtype RawValue: Decodable
    
    init(_ rawValue: RawValue) throws
    
}

extension CLLocationCoordinate2D: Codable {
    
    enum CodingKeys: String, CodingKey {
        case longitude, latitude
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        longitude = try values.decode(Double.self, forKey: .longitude)
        latitude = try values.decode(Double.self, forKey: .latitude)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
    
}
