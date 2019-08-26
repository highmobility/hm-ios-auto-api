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
//  StartStop.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 24/04/2018.
//  Copyright © 2019 High Mobility. All rights reserved.
//

import Foundation


public struct StartStop: FullStandardCommand {

    public let isActive: Bool?


    // MARK: FullStandardCommand

    public var properties: Properties


    init?(properties: Properties) {
        // Ordered by the ID
        isActive = properties.value(for: 0x01)

        // Properties
        self.properties = properties
    }
}

extension StartStop: Identifiable {

    public static var identifier: Identifier = Identifier(0x0063)
}

extension StartStop: MessageTypesGettable {

    public enum MessageTypes: UInt8, MessageTypesKind {

        case getStartStopState              = 0x00
        case startStopState                 = 0x01
        case activateDeactivateStartStop    = 0x02


        public static var all: [StartStop.MessageTypes] {
            return [self.getStartStopState,
                    self.startStopState,
                    self.activateDeactivateStartStop]
        }
    }
}

public extension StartStop {

    static var getStartStopState: [UInt8] {
        return commandPrefix(for: .getStartStopState)
    }

    /// Use `false` to *deactivate* the start-stop system.
    static var activateStartStop: (Bool) -> [UInt8] {
        return {
            return commandPrefix(for: .activateDeactivateStartStop) + $0.propertyBytes(0x01)
        }
    }
}