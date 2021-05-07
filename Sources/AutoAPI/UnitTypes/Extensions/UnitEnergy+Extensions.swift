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
//  UnitEnergy+Extensions.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation


public extension UnitEnergy {

    static let wattHours = UnitEnergy(symbol: "hm_wh", converter: UnitConverterLinear(coefficient: 3600.0))
}

extension UnitEnergy: AAUnitType {

    public static let measurementID: UInt8 = 0x0c

    public static func create(id: UInt8) -> Self? {
        switch id {
        case 0x00:  return UnitEnergy.joules as? Self
        case 0x01:  return UnitEnergy.kilojoules as? Self
        case 0x03:  return UnitEnergy.wattHours as? Self
        case 0x04:  return UnitEnergy.kilowattHours as? Self

        default:    return nil
        }
    }


    public var identifiers: [UInt8]? {
        switch self {
        case .joules: return [Self.measurementID, 0x00]
        case .kilojoules: return [Self.measurementID, 0x01]
        case .wattHours: return [Self.measurementID, 0x03]
        case .kilowattHours: return [Self.measurementID, 0x04]

        default: return nil
        }
    }
}
