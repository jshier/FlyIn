//
//  NetworkManager.swift
//  FlyInNetworking
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Alamofire
import Foundation

public struct Network {
    
    public static let shared = Network()
    
    let queue = DispatchQueue(label: "com.jonshier.FlyIn.NetworkQueue")
    let manager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        return SessionManager(configuration: configuration)
    }()
        
    public func fetchEvents(completionHandler: @escaping (_ result: Result<Events>) -> Void) {
        manager.request(Router.events).validate().responseValue(queue: queue) { (response: DataResponse<Response>) in
            let eventsResult = response.result.value.map { Result.success($0.events) } ??
                                                           Result.failure(response.error!)
            DispatchQueue.main.async { completionHandler(eventsResult) }
        }
    }
    
}

extension DataRequest {
    
    @discardableResult
    func responseValue<Value>(queue: DispatchQueue? = nil, completionHandler: @escaping (_ response: DataResponse<Value>) -> Void) -> Self
        where Value: RawValueDecodable {
            return response(queue: queue, responseSerializer: RawValueDecodableSerializer(), completionHandler: completionHandler)
    }
    
}
