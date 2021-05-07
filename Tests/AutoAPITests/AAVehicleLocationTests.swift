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
//  AAVehicleLocationTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAVehicleLocationTests: XCTestCase {

    // MARK: State Properties
    
    func testCoordinates() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x30, 0x01, 0x04, 0x00, 0x13, 0x01, 0x00, 0x10, 0x40, 0x4a, 0x42, 0x8f, 0x9f, 0x44, 0xd4, 0x45, 0x40, 0x2a, 0xcf, 0x56, 0x21, 0x74, 0xc4, 0xce]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleLocation else {
            return XCTFail("Could not parse bytes as `AAVehicleLocation`")
        }
        
        XCTAssertEqual(capability.coordinates?.value?.bytes, AACoordinates(latitude: 52.520008, longitude: 13.404954).bytes)
    }
    
    func testHeading() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x30, 0x01, 0x05, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x02, 0x00, 0x40, 0x2a, 0xbd, 0x80, 0xc3, 0x08, 0xfe, 0xac]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleLocation else {
            return XCTFail("Could not parse bytes as `AAVehicleLocation`")
        }
        
        XCTAssertEqual(capability.heading?.value, Measurement<UnitAngle>(value: 13.370123, unit: .degrees))
    }
    
    func testAltitude() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x30, 0x01, 0x06, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x00, 0x40, 0x60, 0xb0, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleLocation else {
            return XCTFail("Could not parse bytes as `AAVehicleLocation`")
        }
        
        XCTAssertEqual(capability.altitude?.value, Measurement<UnitLength>(value: 133.5, unit: .meters))
    }
    
    func testPrecision() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x30, 0x01, 0x07, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x00, 0x40, 0x7f, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleLocation else {
            return XCTFail("Could not parse bytes as `AAVehicleLocation`")
        }
        
        XCTAssertEqual(capability.precision?.value, Measurement<UnitLength>(value: 500.0, unit: .meters))
    }
    
    func testGpsSource() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x30, 0x01, 0x08, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleLocation else {
            return XCTFail("Could not parse bytes as `AAVehicleLocation`")
        }
        
        XCTAssertEqual(capability.gpsSource?.value, AAVehicleLocationGpsSource.real)
    }
    
    func testGpsSignalStrength() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x30, 0x01, 0x09, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xe9, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleLocation else {
            return XCTFail("Could not parse bytes as `AAVehicleLocation`")
        }
        
        XCTAssertEqual(capability.gpsSignalStrength?.value, 0.8)
    }


    // MARK: Getters
    
    func testGetVehicleLocation() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x30, 0x00]
        
        XCTAssertEqual(bytes, AAVehicleLocation.getVehicleLocation())
    }
    
    func testGetVehicleLocationAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x30, 0x02]
        
        XCTAssertEqual(bytes, AAVehicleLocation.getVehicleLocationAvailability())
    }
    
    func testGetVehicleLocationProperties() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x30, 0x00, 0x04]
        let getterBytes = AAVehicleLocation.getVehicleLocationProperties(ids: .coordinates)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetVehicleLocationPropertiesAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x30, 0x02, 0x04]
        let getterBytes = AAVehicleLocation.getVehicleLocationPropertiesAvailability(ids: .coordinates)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAVehicleLocation.identifier, 0x0030)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAVehicleLocation.PropertyIdentifier.coordinates.rawValue, 0x04)
        XCTAssertEqual(AAVehicleLocation.PropertyIdentifier.heading.rawValue, 0x05)
        XCTAssertEqual(AAVehicleLocation.PropertyIdentifier.altitude.rawValue, 0x06)
        XCTAssertEqual(AAVehicleLocation.PropertyIdentifier.precision.rawValue, 0x07)
        XCTAssertEqual(AAVehicleLocation.PropertyIdentifier.gpsSource.rawValue, 0x08)
        XCTAssertEqual(AAVehicleLocation.PropertyIdentifier.gpsSignalStrength.rawValue, 0x09)
    }
}
