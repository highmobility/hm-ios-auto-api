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
//  AARooftopControlConvertibleRoofState.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


/// Convertible roof state enum.
public enum AARooftopControlConvertibleRoofState: String, CaseIterable, Codable, HMBytesConvertable {

    case closed
    case closedSecured
    case emergencyLocked
    case hardTopMounted
    case intermediatePosition
    case loadingPosition
    case loadingPositionImmediate
    case open
    case openSecured


    public var byteValue: UInt8 {
        switch self {
        case .closed: return 0x00
        case .open: return 0x01
        case .emergencyLocked: return 0x02
        case .closedSecured: return 0x03
        case .openSecured: return 0x04
        case .hardTopMounted: return 0x05
        case .intermediatePosition: return 0x06
        case .loadingPosition: return 0x07
        case .loadingPositionImmediate: return 0x08
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
        case 0x00: self = .closed
        case 0x01: self = .open
        case 0x02: self = .emergencyLocked
        case 0x03: self = .closedSecured
        case 0x04: self = .openSecured
        case 0x05: self = .hardTopMounted
        case 0x06: self = .intermediatePosition
        case 0x07: self = .loadingPosition
        case 0x08: self = .loadingPositionImmediate
        default: return nil
        }
    }
}
