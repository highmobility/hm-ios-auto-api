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
//  AAWebhook.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAWebhook: Codable, HMBytesConvertable {

    /// If the specified webhook is available..
    public enum Available: String, CaseIterable, Codable, HMBytesConvertable {
    
        case unavailable = "unavailable"
        case available = "available"
    
    
        public var byteValue: UInt8 {
            switch self {
            case .unavailable: return 0x00
            case .available: return 0x01
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
            case 0x00: self = .unavailable
            case 0x01: self = .available
            default: return nil
            }
        }
    }

    /// Event enum.
    public enum Event: String, CaseIterable, Codable, HMBytesConvertable {
    
        case ping = "ping"
        case tripStarted = "tripStarted"
        case tripEnded = "tripEnded"
        case vehicleLocationChanged = "vehicleLocationChanged"
        case authorizationChanged = "authorizationChanged"
        case tirePressureChanged = "tirePressureChanged"
    
    
        public var byteValue: UInt8 {
            switch self {
            case .ping: return 0x00
            case .tripStarted: return 0x01
            case .tripEnded: return 0x02
            case .vehicleLocationChanged: return 0x03
            case .authorizationChanged: return 0x04
            case .tirePressureChanged: return 0x05
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
            case 0x00: self = .ping
            case 0x01: self = .tripStarted
            case 0x02: self = .tripEnded
            case 0x03: self = .vehicleLocationChanged
            case 0x04: self = .authorizationChanged
            case 0x05: self = .tirePressureChanged
            default: return nil
            }
        }
    }


    /// If the specified webhook is available..
    public var available: Available

    /// Event.
    public var event: Event


    /// Initialise `AAWebhook` with arguments.
    ///
    /// - parameters:
    ///     - available: If the specified webhook is available..
    ///     - event: Event.
    public init(available: Available, event: Event) {
        self.bytes = [available.bytes, event.bytes].flatMap { $0 }
        self.available = available
        self.event = event
    }


    // MARK: HMBytesConvertable
    
    public let bytes: [UInt8]
    
    
    /// Initialise `AAWebhook` with bytes.
    ///
    /// - parameters:
    ///     - bytes: Bytes array in `[UInt8]`.
    public required init?(bytes: [UInt8]) {
        guard bytes.count == 2 else {
            return nil
        }
    
        guard let available = Available(bytes: bytes[0..<1].bytes),
    		  let event = Event(bytes: bytes[1..<2].bytes) else {
            return nil
        }
    
        self.bytes = bytes
        self.available = available
        self.event = event
    }
}