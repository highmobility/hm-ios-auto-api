//
// AutoAPITests
// Copyright (C) 2019 High-Mobility GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//
// Please inquire about commercial licensing options at
// licensing@high-mobility.com
//
//
//  AADriverCardTests.swift
//  AutoAPITests
//
//  Created by Mikk Rätsep on 03/04/2019.
//  Copyright © 2019 High Mobility GmbH. All rights reserved.
//

@testable import AutoAPI
import XCTest


class AADriverCardTests: XCTestCase {

    static var allTests = [("testBytes", testBytes),
                           ("testInit", testInit)]


    // MARK: XCTestCase

    func testBytes() {
        let bytes: [UInt8] = [
            0x01,   // Driver 1
            0x01    // Driver card present
        ]

        XCTAssertEqual(AADriverCard(driverNumber: 1, present: .present).bytes, bytes)
    }

    func testInit() {
        // Successful
        let bytes1: [UInt8] = [
            0x01,   // Driver 1
            0x01    // Driver card present
        ]

        if let card = AADriverCard(bytes: bytes1) {
            XCTAssertEqual(card.driverNumber, 1)
            XCTAssertEqual(card.present, .present)
        }
        else {
            XCTFail("Failed to initialise AADriverCard")
        }

        // Fail#1
        let bytes2: [UInt8] = [
            0x01    // Invalid bytes count
        ]

        XCTAssertNil(AADriverCard(bytes: bytes2))

        // Fail#2
        let bytes3: [UInt8] = [
            0x01,   // Driver 1
            0x0F    // INVALID
        ]

        XCTAssertNil(AADriverCard(bytes: bytes3))
    }
}
