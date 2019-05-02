//
// AutoAPI
// Copyright (C) 2019 High-Mobility GmbH
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
//  AAVehicleLocation.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 04/12/2017.
//  Copyright © 2019 High Mobility GmbH. All rights reserved.
//

import Foundation


public class AAVehicleLocation: AACapabilityClass, AACapability {

    public let altitude: AAProperty<Double>?
    public let heading: AAProperty<Double>?
    public let coordinates: AAProperty<AACoordinates>?


    // MARK: AACapability

    public static var identifier: AACapabilityIdentifier = 0x0030


    required init(properties: AAProperties) {
        // Ordered by the ID
        /* Level 8 */
        coordinates = properties.property(forIdentifier: 0x04)
        heading = properties.property(forIdentifier: 0x05)
        altitude = properties.property(forIdentifier: 0x06)

        super.init(properties: properties)
    }
}

extension AAVehicleLocation: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case getLocation    = 0x00
        case location       = 0x01
    }
}

public extension AAVehicleLocation {

    static var getLocation: AACommand {
        return command(forMessageType: .getLocation)
    }
}
