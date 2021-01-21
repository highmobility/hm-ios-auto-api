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
//  AAKeyfobPosition.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAKeyfobPosition: AACapability, AAPropertyIdentifying {

    /// Information about the introduction and last update of this capability.
    public enum API: AAAPICurrent {
        /// Level (version) of *AutoAPI* when `AAKeyfobPosition` was introduced to the spec.
        public static let intro: UInt8 = 4
    
        /// Level (version) of *AutoAPI* when `AAKeyfobPosition` was last updated.
        public static let updated: UInt8 = 11
    }


    /// Location enum.
    public enum Location: String, CaseIterable, Codable, HMBytesConvertable {
    
        case outOfRange = "outOfRange"
        case outsideDriverSide = "outsideDriverSide"
        case outsideInFrontOfCar = "outsideInFrontOfCar"
        case outsidePassengerSide = "outsidePassengerSide"
        case outsideBehindCar = "outsideBehindCar"
        case insideCar = "insideCar"
    
    
        public var byteValue: UInt8 {
            switch self {
            case .outOfRange: return 0x00
            case .outsideDriverSide: return 0x01
            case .outsideInFrontOfCar: return 0x02
            case .outsidePassengerSide: return 0x03
            case .outsideBehindCar: return 0x04
            case .insideCar: return 0x05
            }
        }
    
    
        // MARK: HMBytesConvertable
    
        public var bytes: [UInt8] {
            [byteValue]
        }
    
    
        public init?(bytes: [UInt8]) {
            guard let uint8 = UInt8(bytes: bytes) else {
                return nil
            }
    
            switch uint8 {
            case 0x00: self = .outOfRange
            case 0x01: self = .outsideDriverSide
            case 0x02: self = .outsideInFrontOfCar
            case 0x03: self = .outsidePassengerSide
            case 0x04: self = .outsideBehindCar
            case 0x05: self = .insideCar
            default: return nil
            }
        }
    }


    // MARK: Identifiers
    
    public class override var identifier: UInt16 { 0x0048 }


    /// Property identifiers for `AAKeyfobPosition`.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case location = 0x01
    }


    // MARK: Properties
    
    /// Location value.
    public var location: AAProperty<Location>?


    // MARK: Getters
    
    /// Get `AAKeyfobPosition` state (all properties).
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getKeyfobPosition() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.get.rawValue.bytes
    }
    
    /// Get `AAKeyfobPosition` state properties availability.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getKeyfobPositionAvailability() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.availability.rawValue.bytes
    }


    // MARK: AACapability
    
    public required init?(bytes: [UInt8]) {
        super.init(bytes: bytes)
    
        location = extract(property: .location)
    }
}