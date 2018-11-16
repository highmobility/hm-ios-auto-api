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
//  AAWeatherConditions.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 07/12/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct AAWeatherConditions: AAFullStandardCommand {

    public let rainIntensity: AAPercentageInt?


    // MARK: AAFullStandardCommand

    public let properties: AAProperties


    init?(properties: AAProperties) {
        // Ordered by the ID
        rainIntensity = properties.value(for: \AAWeatherConditions.rainIntensity)

        // Properties
        self.properties = properties
    }
}

extension AAWeatherConditions: AAIdentifiable {

    public static var identifier: AACommandIdentifier = 0x0055
}

extension AAWeatherConditions: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case getConditions  = 0x00
        case conditions     = 0x01
    }
}

extension AAWeatherConditions: AAPropertyIdentifierGettable {

    static func propertyID<Type>(for keyPath: KeyPath<AAWeatherConditions, Type>) -> AAPropertyIdentifier {
        switch keyPath {
        case \AAWeatherConditions.rainIntensity: return 0x01

        default:
            return 0x00
        }
    }
}


// MARK: Commands

public extension AAWeatherConditions {

    static var getConditions: [UInt8] {
        return commandPrefix(for: .getConditions)
    }
}