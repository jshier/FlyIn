//
//  RawValueDecodableSerializerTests.swift
//  RawValueDecodableSerializerTests
//
//  Created by Jon Shier on 7/16/17.
//  Copyright © 2017 Jon Shier. All rights reserved.
//

import Alamofire
import XCTest
@testable import FlyInNetworking

class RawValueDecodableSerializerTests: XCTestCase {
    
    func testProperJSONCanBeSerialized() {
        // Given
        let jsonString = """
        {
          "message": "",
          "result": {
            "deletedIds": [
              162812
            ],
            "items": [
              {
                "locs": [
                  {
                    "iLId": 158703,
                    "lon": -88.55984517,
                    "iLTId": -1104,
                    "iLName": "Warbird Alley",
                    "lat": 43.98638021
                  }
                ],
                "sTime": 1500994800000,
                "title": "Warbirds in Review Vultee BT-13",
                "eTime": 1500999300000,
                "html": "<p>Vultee BT-13 owned by the Women Air Force Service Pilots (WASP) Museum.</p><p>History comes to life through legendary wartime aircraft during Warbirds in Review sessions, which delve into aircraft restoration and operation and spotlight veterans sharing stories about what it was like to fly in combat or provide ground support.</p>",
                "iCId": 162756
              },
              {
                "locs": [
                  {
                    "iLId": 156939,
                    "lon": -88.5621011825,
                    "iLTId": -1108,
                    "iLName": "Forum Stage 10",
                    "lat": 43.9831623383
                  }
                ],
                "sTime": 1500903000000,
                "title": "Fabric Covering 101",
                "eTime": 1500907500000,
                "html": "",
                "iCId": 162759
              },
              {
                "locs": [
                  {
                    "iLId": 158132,
                    "lon": -88.56363172,
                    "iLTId": -1110,
                    "iLName": "Hangar A, Booth 1121",
                    "lat": 43.98015114
                  },
                  {
                    "iLId": 158106,
                    "lon": -88.56363038,
                    "iLTId": -1110,
                    "lat": 43.98018009
                  },
                  {
                    "iLId": 158107,
                    "lon": -88.56363038,
                    "iLTId": -1110,
                    "iLName": "Hangar A, Booth 1123",
                    "lat": 43.98020615
                  },
                  {
                    "iLId": 158103,
                    "lon": -88.56363038,
                    "iLTId": -1110,
                    "iLName": "Hangar A, Booth 1124",
                    "lat": 43.98023703
                  }
                ],
                "title": "Trade-A-Plane",
                "html": "",
                "iCId": 162763
              }
              ],
              "ids": [],
              "lastPullTS": 1499215929000,
              "info": {}
            },
          "errors": [],
          "errorCode": 0,
          "success": true
        }
        """
        let data = jsonString.data(using: .utf8)!

        // When
        let result: Result<Response> = RawValueDecodableSerializer().serializeResponse(nil, nil, data, nil)

        // Then
        XCTAssertTrue(result.isSuccess)
        XCTAssertEqual(result.value?.events.events.count, 3)
    }
    
}
