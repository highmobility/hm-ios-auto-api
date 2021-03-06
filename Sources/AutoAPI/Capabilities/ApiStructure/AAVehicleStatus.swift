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
//  AAVehicleStatus.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAVehicleStatus: AACapability, AAPropertyIdentifying {

    /// Information about the introduction and last update of this capability.
    public enum API: AAAPICurrent {
        /// Level (version) of *AutoAPI* when `AAVehicleStatus` was introduced to the spec.
        public static let intro: UInt8 = 2
    
        /// Level (version) of *AutoAPI* when `AAVehicleStatus` was last updated.
        public static let updated: UInt8 = 12
    }


    // MARK: Identifiers
    
    public class override var identifier: UInt16 { 0x0011 }


    /// Property identifiers for `AAVehicleStatus`.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case states = 0x99
    }


    // MARK: Properties
    
    /// The bytes of a Capability state.
    public var states: [AAProperty<AACapabilityState>]?


    // MARK: Getters
    
    /// Get `AAVehicleStatus` state (all properties).
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getVehicleStatus() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.get.rawValue.bytes
    }


    // MARK: AACapability
    
    public required init?(bytes: [UInt8]) {
        super.init(bytes: bytes)
    
        states = extract(properties: .states)
    }
}
