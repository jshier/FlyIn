//
//  Router.swift
//  FlyInNetworking
//
//  Created by Jon Shier on 7/19/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Alamofire
import Foundation

enum Router: URLRequestConvertible {
    
    static let baseURL = URL(string: "https://eaa.liveality.com")!

    case events
    
    var path: String { return "apiut/info/infoContentListing2" }
    var method: HTTPMethod { return .post }
    var parameters: Parameters {
        return ["rId" : 6713610,
                "lastPullTS" : 0,
                "uToken" : "IFTtdprgfqcroiTNVQwFQA9sbGRHjyyWZQbg0zqo31ARJqNsjAoGOOvaIQ47oLXD"] // Should make request to generate one of these
    }
    var parameterEncoding: ParameterEncoding {
        return ArgsEncoding()
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: Router.baseURL.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        return try parameterEncoding.encode(request, with: parameters)
    }
    
}

struct ArgsEncoding: ParameterEncoding {
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        guard let parameters = parameters else { return try urlRequest.asURLRequest() }
        
        let keyValueStrings = parameters.map { kv -> String in
            let valueString = (kv.value as? String).map { $0.debugDescription } ?? String(describing: kv.value)
            return "\"\(kv.key)\":\(valueString)"
        }
        let parameterString = keyValueStrings.joined(separator: ",")
        var request = try urlRequest.asURLRequest()
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = "args={\(parameterString)}".data(using: .utf8)!
        
        return request
    }
    
}
