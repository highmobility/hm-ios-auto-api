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
//  Fueling.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 12/12/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct Fueling: AAFullStandardCommand {

    public let gasFlapState: AAGasFlapState?


    // MARK: AAFullStandardCommand

    public let properties: AAProperties


    init?(properties: AAProperties) {
        // Ordered by the ID
        gasFlapState = AAGasFlapState(rawValue: properties.first(for: 0x01)?.monoValue)

        // Properties
        self.properties = properties
    }
}

extension Fueling: AAIdentifiable {

    public static var identifier: AACommandIdentifier = AACommandIdentifier(0x0040)
}

extension Fueling: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case getGasFlapState    = 0x00
        case gasFlapState       = 0x01
        case openGasFlap        = 0x02
    }
}

public extension Fueling {

    static var getGasFlapState: [UInt8] {
        return commandPrefix(for: .getGasFlapState)
    }

    static var openGasFlap: [UInt8] {
        return commandPrefix(for: .openGasFlap)
    }
}
