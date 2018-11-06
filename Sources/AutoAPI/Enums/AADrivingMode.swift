//
// AutoAPI
// Copyright (C) 2018 High-Mobility GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//
// Please inquire about commercial licensing options at
// licensing@high-mobility.com
//
//
//  AADrivingMode.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 13/12/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public enum AADrivingMode: UInt8 {

    /// Also know as *comfort*
    case regular    = 0x00

    case eco        = 0x01
    case sport      = 0x02
    case sportPlus  = 0x03

    case ecoPlus    = 0x04
}

extension AADrivingMode: AAPropertyConvertable {
    
}

public extension AADrivingMode {

    struct ActivationPeriod: AAItem, AAPropertyConvertable {

        public let mode: AADrivingMode
        public let period: AAPercentageInt


        // MARK: AAItem

        static var size: Int = 2


        init?(bytes: [UInt8]) {
            guard let drivingMode = AADrivingMode(rawValue: bytes[0]) else {
                return nil
            }

            mode = drivingMode
            period = bytes[1]
        }


        // MARK: AAPropertyConvertable

        var propertyValue: [UInt8] {
            return [mode.rawValue, period]
        }
    }


    struct EnergyConsumption: AAItem, AAPropertyConvertable {

        public let mode: AADrivingMode
        public let consumption: Float


        // MARK: AAItem

        static var size: Int = 5


        init?(bytes: [UInt8]) {
            guard let drivingMode = AADrivingMode(rawValue: bytes[0]) else {
                return nil
            }

            mode = drivingMode
            consumption = Float(bytes.dropFirstBytes(1))
        }


        // MARK: AAPropertyConvertable

        var propertyValue: [UInt8] {
            return [mode.rawValue] + consumption.bytes
        }
    }
}
