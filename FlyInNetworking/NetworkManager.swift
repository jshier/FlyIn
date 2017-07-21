//
//  NetworkManager.swift
//  FlyInNetworking
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Alamofire
import Foundation

public struct NetworkManager {
    
    public init() {
        
    }
    
}

extension DataRequest {
    
    @discardableResult
    func responseValue<Value, RawValue>(completionHandler: @escaping (_ response: DataResponse<Value>) -> Void) -> Self
        where Value: RawValueDecodable, RawValue == Value.RawValue {
        return response(responseSerializer: RawValueDecodableSerializer(), completionHandler: completionHandler)
    }
    
}
