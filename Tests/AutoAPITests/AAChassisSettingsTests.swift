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
//  AAChassisSettingsTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAChassisSettingsTests: XCTestCase {

    // MARK: State Properties
    
    func testDrivingMode() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAChassisSettings else {
            return XCTFail("Could not parse bytes as `AAChassisSettings`")
        }
        
        XCTAssertEqual(capability.drivingMode?.value, AADrivingMode.eco)
    }
    
    func testSportChrono() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAChassisSettings else {
            return XCTFail("Could not parse bytes as `AAChassisSettings`")
        }
        
        XCTAssertEqual(capability.sportChrono?.value, SportChrono.active)
    }
    
    func testCurrentSpringRates() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x05, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x00, 0x18, 0x01, 0x40, 0x35, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x01, 0x18, 0x01, 0x40, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAChassisSettings else {
            return XCTFail("Could not parse bytes as `AAChassisSettings`")
        }
        
        guard let currentSpringRates = capability.currentSpringRates?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.currentSpringRates` values from `AAChassisSettings` capability")
        }
        
        XCTAssertTrue(currentSpringRates.contains { $0.bytes == AASpringRate(axle: .front, springRate: Measurement<UnitTorque>(value: 21.0, unit: UnitTorque.newtonMillimeters)).bytes })
        XCTAssertTrue(currentSpringRates.contains { $0.bytes == AASpringRate(axle: .rear, springRate: Measurement<UnitTorque>(value: 23.0, unit: UnitTorque.newtonMillimeters)).bytes })
    }
    
    func testMaximumSpringRates() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x06, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x00, 0x18, 0x01, 0x40, 0x42, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x01, 0x18, 0x01, 0x40, 0x43, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAChassisSettings else {
            return XCTFail("Could not parse bytes as `AAChassisSettings`")
        }
        
        guard let maximumSpringRates = capability.maximumSpringRates?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.maximumSpringRates` values from `AAChassisSettings` capability")
        }
        
        XCTAssertTrue(maximumSpringRates.contains { $0.bytes == AASpringRate(axle: .front, springRate: Measurement<UnitTorque>(value: 37.0, unit: UnitTorque.newtonMillimeters)).bytes })
        XCTAssertTrue(maximumSpringRates.contains { $0.bytes == AASpringRate(axle: .rear, springRate: Measurement<UnitTorque>(value: 39.0, unit: UnitTorque.newtonMillimeters)).bytes })
    }
    
    func testMinimumSpringRates() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x07, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x00, 0x18, 0x01, 0x40, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x01, 0x18, 0x01, 0x40, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAChassisSettings else {
            return XCTFail("Could not parse bytes as `AAChassisSettings`")
        }
        
        guard let minimumSpringRates = capability.minimumSpringRates?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.minimumSpringRates` values from `AAChassisSettings` capability")
        }
        
        XCTAssertTrue(minimumSpringRates.contains { $0.bytes == AASpringRate(axle: .front, springRate: Measurement<UnitTorque>(value: 16.0, unit: UnitTorque.newtonMillimeters)).bytes })
        XCTAssertTrue(minimumSpringRates.contains { $0.bytes == AASpringRate(axle: .rear, springRate: Measurement<UnitTorque>(value: 18.0, unit: UnitTorque.newtonMillimeters)).bytes })
    }
    
    func testCurrentChassisPosition() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x08, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x01, 0x40, 0x39, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAChassisSettings else {
            return XCTFail("Could not parse bytes as `AAChassisSettings`")
        }
        
        XCTAssertEqual(capability.currentChassisPosition?.value, Measurement<UnitLength>(value: 25.4, unit: .millimeters))
    }
    
    func testMaximumChassisPosition() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x09, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x01, 0x40, 0x4b, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAChassisSettings else {
            return XCTFail("Could not parse bytes as `AAChassisSettings`")
        }
        
        XCTAssertEqual(capability.maximumChassisPosition?.value, Measurement<UnitLength>(value: 55.5, unit: .millimeters))
    }
    
    func testMinimumChassisPosition() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x0a, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x01, 0xc0, 0x3c, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAChassisSettings else {
            return XCTFail("Could not parse bytes as `AAChassisSettings`")
        }
        
        XCTAssertEqual(capability.minimumChassisPosition?.value, Measurement<UnitLength>(value: -28.4, unit: .millimeters))
    }


    // MARK: Getters
    
    func testGetChassisSettings() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x00]
        
        XCTAssertEqual(bytes, AAChassisSettings.getChassisSettings())
    }
    
    func testGetChassisSettingsAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x02]
        
        XCTAssertEqual(bytes, AAChassisSettings.getChassisSettingsAvailability())
    }
    
    func testGetChassisSettingsProperties() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x00, 0x01]
        let getterBytes = AAChassisSettings.getChassisSettingsProperties(ids: .drivingMode)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetChassisSettingsPropertiesAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x02, 0x01]
        let getterBytes = AAChassisSettings.getChassisSettingsPropertiesAvailability(ids: .drivingMode)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Setters
    
    func testSetDrivingMode() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AAChassisSettings.setDrivingMode(drivingMode: AADrivingMode.eco)
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testStartStopSportsChrono() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AAChassisSettings.startStopSportsChrono(sportChrono: SportChrono.active)
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testSetSpringRates() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x05, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x00, 0x18, 0x01, 0x40, 0x35, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x01, 0x18, 0x01, 0x40, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        let setterBytes = AAChassisSettings.setSpringRates(currentSpringRates: [AASpringRate(axle: .front, springRate: Measurement<UnitTorque>(value: 21.0, unit: UnitTorque.newtonMillimeters)), AASpringRate(axle: .rear, springRate: Measurement<UnitTorque>(value: 23.0, unit: UnitTorque.newtonMillimeters))])
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testSetChassisPosition() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x53, 0x01, 0x08, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x01, 0x40, 0x39, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66]
        let setterBytes = AAChassisSettings.setChassisPosition(currentChassisPosition: Measurement<UnitLength>(value: 25.4, unit: .millimeters))
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAChassisSettings.identifier, 0x0053)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAChassisSettings.PropertyIdentifier.drivingMode.rawValue, 0x01)
        XCTAssertEqual(AAChassisSettings.PropertyIdentifier.sportChrono.rawValue, 0x02)
        XCTAssertEqual(AAChassisSettings.PropertyIdentifier.currentSpringRates.rawValue, 0x05)
        XCTAssertEqual(AAChassisSettings.PropertyIdentifier.maximumSpringRates.rawValue, 0x06)
        XCTAssertEqual(AAChassisSettings.PropertyIdentifier.minimumSpringRates.rawValue, 0x07)
        XCTAssertEqual(AAChassisSettings.PropertyIdentifier.currentChassisPosition.rawValue, 0x08)
        XCTAssertEqual(AAChassisSettings.PropertyIdentifier.maximumChassisPosition.rawValue, 0x09)
        XCTAssertEqual(AAChassisSettings.PropertyIdentifier.minimumChassisPosition.rawValue, 0x0a)
    }
}