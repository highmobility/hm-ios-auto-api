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
//  AACharging.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 30/11/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public class AACharging: AACapabilityClass, AACapability {

    public let batteryCurrentAC: AAProperty<Float>?
    public let batteryCurrentDC: AAProperty<Float>?
    public let batteryLevel: AAProperty<AAPercentage>?
    public let batteryTemperature: AAProperty<Float>?
    public let chargeLimit: AAProperty<AAPercentage>?
    public let chargeMode: AAProperty<AAChargeMode>?
    public let chargePortState: AAProperty<AAOpenClose>?
    public let chargerVoltageAC: AAProperty<Float>?
    public let chargerVoltageDC: AAProperty<Float>?
    public let chargingRate: AAProperty<Float>?
    public let chargingWindowChosen: AAProperty<AAChosenState>?
    public let departureTimes: [AAProperty<AADepartureTime>]?
    public let estimatedRange: AAProperty<UInt16>?
    public let maxChargingCurrentAC: AAProperty<Float>?
    public let pluggedIn: AAProperty<AAPluggedInState>?
    public let plugType: AAProperty<AAPlugType>?
    public let reductionOfChargingCurrentTimes: [AAProperty<AAReductionTime>]?
    public let state: AAProperty<AAChargingState>?
    public let timers: [AAProperty<AAChargingTimer>]?
    public let timeToCompleteCharge: AAProperty<UInt16>?


    // MARK: AACapability

    public static var identifier: AACommandIdentifier = 0x0023


    required init(properties: AAProperties) {
        // Ordered by the ID
        estimatedRange = properties.property(forIdentifier: 0x02)
        batteryLevel = properties.property(forIdentifier: 0x03)
        batteryCurrentAC = properties.property(forIdentifier: 0x04)
        batteryCurrentDC = properties.property(forIdentifier: 0x05)
        chargerVoltageAC = properties.property(forIdentifier: 0x06)
        chargerVoltageDC = properties.property(forIdentifier: 0x07)
        chargeLimit = properties.property(forIdentifier: 0x08)
        timeToCompleteCharge = properties.property(forIdentifier: 0x09)
        chargingRate = properties.property(forIdentifier: 0x0A)
        chargePortState = properties.property(forIdentifier: 0x0B)
        chargeMode = properties.property(forIdentifier: 0x0C)
        /* Level 8 */
        maxChargingCurrentAC = properties.property(forIdentifier: 0x0E)
        plugType = properties.property(forIdentifier: 0x0F)
        chargingWindowChosen = properties.property(forIdentifier: 0x10)
        departureTimes = properties.allOrNil(forIdentifier: 0x11)
        reductionOfChargingCurrentTimes = properties.allOrNil(forIdentifier: 0x13)
        batteryTemperature = properties.property(forIdentifier: 0x14)
        timers = properties.allOrNil(forIdentifier: 0x15)
        pluggedIn = properties.property(forIdentifier: 0x16)
        state = properties.property(forIdentifier: 0x17)

        super.init(properties: properties)
    }
}

extension AACharging: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case getChargingState       = 0x00
        case chargingState          = 0x01
        case startStopCharging      = 0x12
        case setChargeLimit         = 0x13
        case openCloseChargePort    = 0x14
        case setChargeMode          = 0x15
        case setChargingTimers      = 0x16
        case setReductionTimes      = 0x17
    }
}

public extension AACharging {

    static var getChargingState: AACommand {
        return command(forMessageType: .getChargingState)
    }


    static func openCloseChargePort(_ state: AAOpenClose) -> AACommand {
        let properties = [state.property(forIdentifier: 0x01)]

        return command(forMessageType: .openCloseChargePort, properties: properties)
    }

    static func setChargeLimit(_ limit: AAPercentage) -> AACommand {
        let properties = [limit.property(forIdentifier: 0x01)]

        return command(forMessageType: .setChargeLimit, properties: properties)
    }

    /// - warning: `.immediate` is not supported
    static func setChargeMode(_ mode: AAChargeMode) -> AACommand? {
        guard mode != .immediate else {
            return nil
        }

        let properties = [mode.property(forIdentifier: 0x01)]

        return command(forMessageType: .setChargeMode, properties: properties)
    }

    static func setChargingTimers(_ timers: [AAChargingTimer]) -> AACommand {
        let properties = timers.map { $0.property(forIdentifier: 0x0D) }

        return command(forMessageType: .setChargingTimers, properties: properties)
    }

    static func setReductionOfChargingCurrentTimes(_ times: [AAReductionTime]) -> AACommand {
        let properties = times.map { $0.property(forIdentifier: 0x01) }

        return command(forMessageType: .setReductionTimes, properties: properties)
    }

    static func startStopCharging(_ state: AAActiveState) -> AACommand {
        let properties = [state.property(forIdentifier: 0x01)]

        return command(forMessageType: .startStopCharging, properties: properties)
    }
}