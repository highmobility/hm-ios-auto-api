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
//  AAWindscreen.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 01/12/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct AAWindscreen: AAFullStandardCommand {

    public let damage: AAWindscreenDamage?
    public let damageConfidence: AAPercentageInt?
    public let damageDetectionTime: Date?
    /// The *position* of the *damage* on the Windscreen.
    public let damageZone: AAZone?
    public let needsReplacement: AANeedsReplacement?
    /// The *size* of *zones* on the Windscreen.
    public let zoneMatrix: AAZone?
    public let wipersIntensity: AAWipersIntensity?
    public let wipersState: AAWipersState?


    // MARK: AAFullStandardCommand

    public let properties: AAProperties


    init?(properties: AAProperties) {
        // Ordered by the ID
        wipersState = AAWipersState(properties: properties, keyPath: \AAWindscreen.wipersState)
        wipersIntensity = AAWipersIntensity(properties: properties, keyPath: \AAWindscreen.wipersIntensity)
        damage = AAWindscreenDamage(properties: properties, keyPath: \AAWindscreen.damage)
        zoneMatrix = AAZone(properties: properties, keyPath: \AAWindscreen.zoneMatrix)
        damageZone = AAZone(properties: properties, keyPath: \AAWindscreen.damageZone)
        needsReplacement = AANeedsReplacement(properties: properties, keyPath: \AAWindscreen.needsReplacement)
        damageConfidence = properties.value(for: \AAWindscreen.damageConfidence)
        damageDetectionTime = properties.value(for: \AAWindscreen.damageDetectionTime)

        // Properties
        self.properties = properties
    }
}

extension AAWindscreen: AAIdentifiable {

    public static var identifier: AACommandIdentifier = 0x0042
}

extension AAWindscreen: AALegacyGettable {

    public struct Legacy: AALegacyType {

        public enum MessageTypes: UInt8, CaseIterable {

            case getWindscreenState     = 0x00
            case windscreenState        = 0x01
            case setWindscreenDamage    = 0x02
        }


        public init(properties: AAProperties) {

        }
    }
}

extension AAWindscreen: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case getWindscreenState     = 0x00
        case windscreenState        = 0x01
        case setDamage              = 0x12
        case setNeedsReplacement    = 0x13
        case activateWipers         = 0x14
    }
}

extension AAWindscreen: AAPropertyIdentifierGettable {

    static func propertyID<Type>(for keyPath: KeyPath<AAWindscreen, Type>) -> AAPropertyIdentifier {
        switch keyPath {
        case \AAWindscreen.wipersState:         return 0x01
        case \AAWindscreen.wipersIntensity:     return 0x02
        case \AAWindscreen.damage:              return 0x03
        case \AAWindscreen.zoneMatrix:          return 0x04
        case \AAWindscreen.damageZone:          return 0x05
        case \AAWindscreen.needsReplacement:    return 0x06
        case \AAWindscreen.damageConfidence:    return 0x07
        case \AAWindscreen.damageDetectionTime: return 0x08

        default:
            return 0x00
        }
    }
}


// MARK: Commands

public extension AAWindscreen {

    static var getWindscreenState: [UInt8] {
        return commandPrefix(for: .getWindscreenState)
    }


    static func activateWipers(_ state: AAWipersState, intensity: AAWipersIntensity?) -> [UInt8] {
        return commandPrefix(for: .activateWipers) + [state.propertyBytes(0x01),
                                                      intensity?.propertyBytes(0x02)].propertiesValuesCombined
    }

    static func setDamage(_ damage: AAWindscreenDamage, in zone: AAZone) -> [UInt8] {
        return commandPrefix(for: .setDamage) + [damage.propertyBytes(0x01),
                                                 zone.propertyBytes(0x02)].propertiesValuesCombined
    }

    static func setNeedsReplacement(_ needsReplacement: AANeedsReplacement) -> [UInt8] {
        return commandPrefix(for: .setNeedsReplacement) + needsReplacement.propertyBytes(0x01)
    }
}

public extension AAWindscreen.Legacy {

    struct Damage {
        public let damage: AAWindscreenDamage
        public let zone: AAZone
        public let needsReplacement: AANeedsReplacement

        public init(damage: AAWindscreenDamage, zone: AAZone, needsReplacement: AANeedsReplacement) {
            self.damage = damage
            self.zone = zone
            self.needsReplacement = needsReplacement
        }
    }


    static var getWindscreenState: [UInt8] {
        return commandPrefix(for: AAWindscreen.self, messageType: .getWindscreenState)
    }

    static var setWindscreenDamage: (Damage) -> [UInt8] {
        return {
            let damageBytes = $0.damage.propertyBytes(0x03)
            let zoneBytes = $0.zone.propertyBytes(0x05)
            let replacementBytes = $0.needsReplacement.propertyBytes(0x06)

            return commandPrefix(for: AAWindscreen.self, messageType: .setWindscreenDamage) + damageBytes + zoneBytes + replacementBytes
        }
    }
}
