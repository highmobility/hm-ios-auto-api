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
//  AADoorPosition.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AADoorPosition: Codable, HMBytesConvertable {

    /// Location enum.
    public enum Location: String, CaseIterable, Codable, HMBytesConvertable {
    
        case frontLeft = "frontLeft"
        case frontRight = "frontRight"
        case rearRight = "rearRight"
        case rearLeft = "rearLeft"
        case all = "all"
    
    
        public var byteValue: UInt8 {
            switch self {
            case .frontLeft: return 0x00
            case .frontRight: return 0x01
            case .rearRight: return 0x02
            case .rearLeft: return 0x03
            case .all: return 0x05
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
            case 0x00: self = .frontLeft
            case 0x01: self = .frontRight
            case 0x02: self = .rearRight
            case 0x03: self = .rearLeft
            case 0x05: self = .all
            default: return nil
            }
        }
    }


    /// Location.
    public var location: Location

    /// Position.
    public var position: AAPosition


    /// Initialise `AADoorPosition` with arguments.
    ///
    /// - parameters:
    ///     - location: Location.
    ///     - position: Position.
    public init(location: Location, position: AAPosition) {
        self.bytes = [location.bytes, position.bytes].flatMap { $0 }
        self.location = location
        self.position = position
    }


    // MARK: HMBytesConvertable
    
    public let bytes: [UInt8]
    
    
    /// Initialise `AADoorPosition` with bytes.
    ///
    /// - parameters:
    ///     - bytes: Bytes array in `[UInt8]`.
    public required init?(bytes: [UInt8]) {
        guard bytes.count == 2 else {
            return nil
        }
    
        guard let location = Location(bytes: bytes[0..<1].bytes),
    		  let position = AAPosition(bytes: bytes[1..<2].bytes) else {
            return nil
        }
    
        self.bytes = bytes
        self.location = location
        self.position = position
    }
}