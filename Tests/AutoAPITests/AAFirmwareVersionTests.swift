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
//  AAFirmwareVersionTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAFirmwareVersionTests: XCTestCase {

    // MARK: State Properties
    
    func testHmKitVersion() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x03, 0x01, 0x01, 0x00, 0x06, 0x01, 0x00, 0x03, 0x01, 0x0f, 0x21]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAFirmwareVersion else {
            return XCTFail("Could not parse bytes as `AAFirmwareVersion`")
        }
        
        XCTAssertEqual(capability.hmKitVersion?.value?.bytes, AAHMKitVersion(major: 1, minor: 15, patch: 33).bytes)
    }
    
    func testHmKitBuildName() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x03, 0x01, 0x02, 0x00, 0x0f, 0x01, 0x00, 0x0c, 0x62, 0x74, 0x73, 0x74, 0x61, 0x63, 0x6b, 0x2d, 0x75, 0x61, 0x72, 0x74]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAFirmwareVersion else {
            return XCTFail("Could not parse bytes as `AAFirmwareVersion`")
        }
        
        XCTAssertEqual(capability.hmKitBuildName?.value, "btstack-uart")
    }
    
    func testApplicationVersion() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x03, 0x01, 0x03, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x76, 0x31, 0x2e, 0x35, 0x2d, 0x70, 0x72, 0x6f, 0x64]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAFirmwareVersion else {
            return XCTFail("Could not parse bytes as `AAFirmwareVersion`")
        }
        
        XCTAssertEqual(capability.applicationVersion?.value, "v1.5-prod")
    }


    // MARK: Getters
    
    func testGetFirmwareVersion() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x03, 0x00]
        
        XCTAssertEqual(bytes, AAFirmwareVersion.getFirmwareVersion())
    }
    
    func testGetFirmwareVersionProperties() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x03, 0x00, 0x01]
        let getterBytes = AAFirmwareVersion.getFirmwareVersionProperties(ids: .hmKitVersion)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAFirmwareVersion.identifier, 0x0003)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAFirmwareVersion.PropertyIdentifier.hmKitVersion.rawValue, 0x01)
        XCTAssertEqual(AAFirmwareVersion.PropertyIdentifier.hmKitBuildName.rawValue, 0x02)
        XCTAssertEqual(AAFirmwareVersion.PropertyIdentifier.applicationVersion.rawValue, 0x03)
    }
}
