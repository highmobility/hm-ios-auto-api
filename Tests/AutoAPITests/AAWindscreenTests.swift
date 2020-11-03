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
//  AAWindscreenTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAWindscreenTests: XCTestCase {

    // MARK: State Properties
    
    func testWipersStatus() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAWindscreen else {
            return XCTFail("Could not parse bytes as `AAWindscreen`")
        }
        
        XCTAssertEqual(capability.wipersStatus?.value, .automatic)
    }
    
    func testWipersIntensity() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x03]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAWindscreen else {
            return XCTFail("Could not parse bytes as `AAWindscreen`")
        }
        
        XCTAssertEqual(capability.wipersIntensity?.value, .level3)
    }
    
    func testWindscreenDamage() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x03, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAWindscreen else {
            return XCTFail("Could not parse bytes as `AAWindscreen`")
        }
        
        XCTAssertEqual(capability.windscreenDamage?.value, .impactButNoDamageDetected)
    }
    
    func testWindscreenZoneMatrix() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x04, 0x00, 0x05, 0x01, 0x00, 0x02, 0x04, 0x03]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAWindscreen else {
            return XCTFail("Could not parse bytes as `AAWindscreen`")
        }
        
        XCTAssertEqual(capability.windscreenZoneMatrix?.value?.bytes, AAZone(horizontal: 4, vertical: 3).bytes)
    }
    
    func testWindscreenDamageZone() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x05, 0x00, 0x05, 0x01, 0x00, 0x02, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAWindscreen else {
            return XCTFail("Could not parse bytes as `AAWindscreen`")
        }
        
        XCTAssertEqual(capability.windscreenDamageZone?.value?.bytes, AAZone(horizontal: 1, vertical: 2).bytes)
    }
    
    func testWindscreenNeedsReplacement() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x06, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAWindscreen else {
            return XCTFail("Could not parse bytes as `AAWindscreen`")
        }
        
        XCTAssertEqual(capability.windscreenNeedsReplacement?.value, .noReplacementNeeded)
    }
    
    func testWindscreenDamageConfidence() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x07, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xee, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAWindscreen else {
            return XCTFail("Could not parse bytes as `AAWindscreen`")
        }
        
        XCTAssertEqual(capability.windscreenDamageConfidence?.value, 0.95)
    }
    
    func testWindscreenDamageDetectionTime() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x08, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x00, 0x00, 0x01, 0x59, 0x89, 0x38, 0xe7, 0x88]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAWindscreen else {
            return XCTFail("Could not parse bytes as `AAWindscreen`")
        }
        
        XCTAssertNotNil(DateFormatter.hmFormatter.date(from: "2017-01-10T16:32:05.000Z"))
        XCTAssertEqual(capability.windscreenDamageDetectionTime?.value, DateFormatter.hmFormatter.date(from: "2017-01-10T16:32:05.000Z"))
    }


    // MARK: Getters
    
    func testGetWindscreenState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x00]
        
        XCTAssertEqual(bytes, AAWindscreen.getWindscreenState())
    }
    
    func testGetWindscreenStateAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x02]
        
        XCTAssertEqual(bytes, AAWindscreen.getWindscreenStateAvailability())
    }
    
    func testGetWindscreenStateProperties() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x00, 0x01]
        let getterBytes = AAWindscreen.getWindscreenStateProperties(ids: .wipersStatus)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetWindscreenStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x02, 0x01]
        let getterBytes = AAWindscreen.getWindscreenStatePropertiesAvailability(ids: .wipersStatus)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Setters
    
    func testSetWindscreenDamage() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x03, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01, 0x05, 0x00, 0x05, 0x01, 0x00, 0x02, 0x01, 0x02]
        let setterBytes = AAWindscreen.setWindscreenDamage(windscreenDamage: .impactButNoDamageDetected, windscreenDamageZone: AAZone(horizontal: 1, vertical: 2))
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testSetWindscreenReplacementNeeded() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x06, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AAWindscreen.setWindscreenReplacementNeeded(windscreenNeedsReplacement: .noReplacementNeeded)
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testControlWipers() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x42, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x03]
        let setterBytes = AAWindscreen.controlWipers(wipersIntensity: .level3, wipersStatus: .automatic)
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAWindscreen.identifier, 0x0042)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAWindscreen.PropertyIdentifier.wipersStatus.rawValue, 0x01)
        XCTAssertEqual(AAWindscreen.PropertyIdentifier.wipersIntensity.rawValue, 0x02)
        XCTAssertEqual(AAWindscreen.PropertyIdentifier.windscreenDamage.rawValue, 0x03)
        XCTAssertEqual(AAWindscreen.PropertyIdentifier.windscreenZoneMatrix.rawValue, 0x04)
        XCTAssertEqual(AAWindscreen.PropertyIdentifier.windscreenDamageZone.rawValue, 0x05)
        XCTAssertEqual(AAWindscreen.PropertyIdentifier.windscreenNeedsReplacement.rawValue, 0x06)
        XCTAssertEqual(AAWindscreen.PropertyIdentifier.windscreenDamageConfidence.rawValue, 0x07)
        XCTAssertEqual(AAWindscreen.PropertyIdentifier.windscreenDamageDetectionTime.rawValue, 0x08)
    }
}