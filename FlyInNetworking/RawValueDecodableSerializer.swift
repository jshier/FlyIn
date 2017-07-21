//
//  RawValueDecodableSerializer.swift
//  FlyInNetworking
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Alamofire
import Foundation

struct RawValueDecodableSerializer<Value>: DataResponseSerializerProtocol where Value: RawValueDecodable {
    
    var serializeResponse: (URLRequest?, HTTPURLResponse?, Data?, Error?) -> Result<Value> = { (request, response, data, error) in
        guard error == nil else { return .failure(NetworkError.response(error: error!)) }
        
        guard let data = data else { return .failure(NetworkError.data) }
        
        do {
            let rawValue = try JSONDecoder().decode(Value.RawValue.self, from: data)
            return .success(try Value(rawValue))
        } catch {
            return .failure(NetworkError.decoding(error: error))
        }
    }
    
}

enum NetworkError: Error {
    
    case response(error: Error)
    case data
    case decoding(error: Error)
    
}
