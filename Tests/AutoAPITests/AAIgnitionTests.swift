//
//  The MIT License
//
//  Copyright (c) 2014- High-Mobility GmbH (https://high-mobility.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//
//  AAIgnitionTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAIgnitionTests: XCTestCase {

    // MARK: State Properties
    
    func testStatus() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x35, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAIgnition else {
            return XCTFail("Could not parse bytes as `AAIgnition`")
        }
        
        XCTAssertEqual(capability.status?.value, .off)
    }
    
    func testAccessoriesStatus() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x35, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAIgnition else {
            return XCTFail("Could not parse bytes as `AAIgnition`")
        }
        
        XCTAssertEqual(capability.accessoriesStatus?.value, .on)
    }
    
    func testState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x35, 0x01, 0x03, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAIgnition else {
            return XCTFail("Could not parse bytes as `AAIgnition`")
        }
        
        XCTAssertEqual(capability.state?.value, .accessory)
    }


    // MARK: Getters
    
    func testGetIgnitionState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x35, 0x00]
        
        XCTAssertEqual(bytes, AAIgnition.getIgnitionState())
    }
    
    func testGetIgnitionStateAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x35, 0x02]
        
        XCTAssertEqual(bytes, AAIgnition.getIgnitionStateAvailability())
    }
    
    func testGetIgnitionStateProperties() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x35, 0x00, 0x01]
        let getterBytes = AAIgnition.getIgnitionStateProperties(ids: .status)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetIgnitionStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x35, 0x02, 0x01]
        let getterBytes = AAIgnition.getIgnitionStatePropertiesAvailability(ids: .status)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Setters
    
    func testTurnIgnitionOnOff() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x35, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        let setterBytes = AAIgnition.turnIgnitionOnOff(status: .off)
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAIgnition.identifier, 0x0035)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAIgnition.PropertyIdentifier.status.rawValue, 0x01)
        XCTAssertEqual(AAIgnition.PropertyIdentifier.accessoriesStatus.rawValue, 0x02)
        XCTAssertEqual(AAIgnition.PropertyIdentifier.state.rawValue, 0x03)
    }
}