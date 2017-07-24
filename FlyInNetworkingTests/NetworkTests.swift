//
//  NetworkTests.swift
//  FlyInNetworkingTests
//
//  Created by Jon Shier on 7/19/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Alamofire
import XCTest
@testable import FlyInNetworking

class NetworkTests: XCTestCase {
    
    func testRequestingEvents() {
        // Given
        var networkResult: Result<Events>?
        weak var networkExpectation = expectation(description: "Network request should finish.")
        
        // When
        Network.shared.fetchEvents { events in
            networkResult = events
            networkExpectation?.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        // Then
        guard let result = networkResult else { XCTFail(); return }
        
        XCTAssertTrue(result.isSuccess)
    }
    
}

