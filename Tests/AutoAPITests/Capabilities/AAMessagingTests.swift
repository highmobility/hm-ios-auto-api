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
//  AAMessagingTests.swift
//  AutoAPITests
//
//  Created by Mikk Rätsep on 13/12/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import AutoAPI
import XCTest


class AAMessagingTests: XCTestCase {

    static var allTests = [("testMessageReceived", testMessageReceived),
                           ("testSendMessage", testSendMessage)]


    // MARK: XCTestCase

    func testMessageReceived() {
        let bytes: [UInt8] = [
            0x00, 0x37, // MSB, LSB Message Identifier for Messaging
            0x00,       // Message Type for Message Received

            0x01,       // Property Identifier for Text
            0x00, 0x08, // Property size is 8 bytes
            0x01,       // Data component
            0x00, 0x05, // Data component size is 5 bytes
            0x48, 0x65, 0x6c, 0x6c, 0x6f,   // "Hello"

            0x02,       // Property Identifier for Sender Handle
            0x00, 0x11, // Property size is 17 bytes
            0x01,       // Data component
            0x00, 0x0e, // Data component size is 14 bytes
            0x2b, 0x31, 0x20, 0x35, 0x35, 0x35, 0x2d,   //
            0x35, 0x35, 0x35, 0x2d, 0x35, 0x35, 0x35    // +1 555-555-555
        ]

        let message = AAMessaging.received(message: "Hello", senderHandle: "+1 555-555-555")

        XCTAssertEqual(message.bytes, bytes)
    }

    func testSendMessage() {
        let bytes: [UInt8] = [
            0x00, 0x37, // MSB, LSB Message Identifier for Messaging
            0x01,       // Message Type for Send Message

            0x01,       // Property Identifier for Text
            0x00, 0x10, // Property size is 16 bytes
            0x01,       // Data component
            0x00, 0x0d, // Data component size is 13 bytes
            0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x20,         //
            0x79, 0x6f, 0x75, 0x20, 0x74, 0x6f, 0x6f,   // "Hello you too"

            0x02,       // Property Identifier for Recipient Handle
            0x00, 0x11, // Propery size is 17 bytes
            0x01,       // Data component
            0x00, 0x0e, // Propery size is 14 bytes
            0x2b, 0x31, 0x20, 0x35, 0x35, 0x35, 0x2d,   //
            0x35, 0x35, 0x35, 0x2d, 0x35, 0x35, 0x35    // +1 555-555-555
        ]

        guard let messaging = AAAutoAPI.parseBinary(bytes) as? AAMessaging else {
            return XCTFail("Parsed value is not AAMessaging")
        }

        XCTAssertEqual(messaging.text?.value, "Hello you too")
        XCTAssertEqual(messaging.recipientHandle?.value, "+1 555-555-555")
    }
}
