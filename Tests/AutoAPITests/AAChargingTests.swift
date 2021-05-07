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
//  AAChargingTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAChargingTests: XCTestCase {

    // MARK: State Properties
    
    func testEstimatedRange() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x02, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x04, 0x40, 0x7b, 0x01, 0x99, 0x99, 0x99, 0x99, 0x9a]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.estimatedRange?.value, Measurement<UnitLength>(value: 432.1, unit: .kilometers))
    }
    
    func testBatteryLevel() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x03, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.batteryLevel?.value, 0.5)
    }
    
    func testChargeLimit() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x08, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xec, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcd]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.chargeLimit?.value, 0.9)
    }
    
    func testTimeToCompleteCharge() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x09, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x07, 0x01, 0x40, 0x4e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.timeToCompleteCharge?.value, Measurement<UnitDuration>(value: 60.0, unit: .minutes))
    }
    
    func testChargePortState() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x0b, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.chargePortState?.value, AAPosition.open)
    }
    
    func testChargeMode() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x0c, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.chargeMode?.value, AAChargingChargeMode.timerBased)
    }
    
    func testMaxChargingCurrent() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x0e, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x09, 0x00, 0x40, 0x39, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.maxChargingCurrent?.value, Measurement<UnitElectricCurrent>(value: 25.0, unit: .amperes))
    }
    
    func testPlugType() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x0f, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.plugType?.value, AAChargingPlugType.type2)
    }
    
    func testChargingWindowChosen() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x10, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.chargingWindowChosen?.value, AAChargingChargingWindowChosen.notChosen)
    }
    
    func testDepartureTimes() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x11, 0x00, 0x06, 0x01, 0x00, 0x03, 0x01, 0x10, 0x20, 0x11, 0x00, 0x06, 0x01, 0x00, 0x03, 0x00, 0x0b, 0x33]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        guard let departureTimes = capability.departureTimes?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.departureTimes` values from `AACharging` capability")
        }
        
        XCTAssertTrue(departureTimes.contains { $0.bytes == AADepartureTime(state: .active, time: AATime(hour: 16, minute: 32)).bytes })
        XCTAssertTrue(departureTimes.contains { $0.bytes == AADepartureTime(state: .inactive, time: AATime(hour: 11, minute: 51)).bytes })
    }
    
    func testReductionTimes() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x13, 0x00, 0x06, 0x01, 0x00, 0x03, 0x00, 0x11, 0x21, 0x13, 0x00, 0x06, 0x01, 0x00, 0x03, 0x01, 0x0c, 0x34]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        guard let reductionTimes = capability.reductionTimes?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.reductionTimes` values from `AACharging` capability")
        }
        
        XCTAssertTrue(reductionTimes.contains { $0.bytes == AAReductionTime(startStop: .start, time: AATime(hour: 17, minute: 33)).bytes })
        XCTAssertTrue(reductionTimes.contains { $0.bytes == AAReductionTime(startStop: .stop, time: AATime(hour: 12, minute: 52)).bytes })
    }
    
    func testBatteryTemperature() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x14, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x17, 0x01, 0x40, 0x43, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.batteryTemperature?.value, Measurement<UnitTemperature>(value: 38.4, unit: .celsius))
    }
    
    func testTimers() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x15, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x59, 0x89, 0x38, 0xe7, 0x88, 0x15, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x01, 0x00, 0x00, 0x01, 0x59, 0x89, 0x3c, 0x91, 0x08, 0x15, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x02, 0x00, 0x00, 0x01, 0x59, 0x89, 0x3c, 0x91, 0x08]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        guard let timers = capability.timers?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.timers` values from `AACharging` capability")
        }
        
        XCTAssertTrue(timers.contains { $0.bytes == AATimer(timerType: .preferredStartTime, date: DateFormatter.hmFormatter.date(from: "2017-01-10T16:32:05.000Z")!).bytes })
        XCTAssertTrue(timers.contains { $0.bytes == AATimer(timerType: .preferredEndTime, date: DateFormatter.hmFormatter.date(from: "2017-01-10T16:36:05.000Z")!).bytes })
        XCTAssertTrue(timers.contains { $0.bytes == AATimer(timerType: .departureDate, date: DateFormatter.hmFormatter.date(from: "2017-01-10T16:36:05.000Z")!).bytes })
    }
    
    func testPluggedIn() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x16, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.pluggedIn?.value, AAChargingPluggedIn.pluggedIn)
    }
    
    func testStatus() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x17, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.status?.value, AAChargingStatus.charging)
    }
    
    func testChargingRate() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x18, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x14, 0x02, 0x40, 0x62, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.chargingRate?.value, Measurement<UnitPower>(value: 150.0, unit: .kilowatts))
    }
    
    func testBatteryCurrent() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x19, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x09, 0x00, 0xbf, 0xe3, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.batteryCurrent?.value, Measurement<UnitElectricCurrent>(value: -0.6, unit: .amperes))
    }
    
    func testChargerVoltage() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x1a, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x0a, 0x00, 0x40, 0x79, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.chargerVoltage?.value, Measurement<UnitElectricPotentialDifference>(value: 400, unit: .volts))
    }
    
    func testCurrentType() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x1b, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.currentType?.value, AAChargingCurrentType.alternatingCurrent)
    }
    
    func testMaxRange() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x1c, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x04, 0x40, 0x81, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.maxRange?.value, Measurement<UnitLength>(value: 555.0, unit: .kilometers))
    }
    
    func testStarterBatteryState() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x1d, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.starterBatteryState?.value, AAChargingStarterBatteryState.green)
    }
    
    func testSmartChargingStatus() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x1e, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.smartChargingStatus?.value, AAChargingSmartChargingStatus.sccIsActive)
    }
    
    func testBatteryLevelAtDeparture() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x1f, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xec, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcd]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.batteryLevelAtDeparture?.value, 0.9)
    }
    
    func testPreconditioningDepartureStatus() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x20, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.preconditioningDepartureStatus?.value, AAActiveState.active)
    }
    
    func testPreconditioningImmediateStatus() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x21, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.preconditioningImmediateStatus?.value, AAActiveState.active)
    }
    
    func testPreconditioningDepartureEnabled() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x22, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.preconditioningDepartureEnabled?.value, AAEnabledState.enabled)
    }
    
    func testPreconditioningError() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x23, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.preconditioningError?.value, AAChargingPreconditioningError.notPossibleLow)
    }
    
    func testBatteryCapacity() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x24, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x0c, 0x04, 0x40, 0x51, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACharging else {
            return XCTFail("Could not parse bytes as `AACharging`")
        }
        
        XCTAssertEqual(capability.batteryCapacity?.value, Measurement<UnitEnergy>(value: 70.0, unit: .kilowattHours))
    }


    // MARK: Non-state or Deprecated Properties
    
    func testBatteryCurrentAC() {
        let bytes: [UInt8] = [0x04, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x09, 0x00, 0xbf, 0xe3, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33]
        
        guard let property: AAProperty<Measurement<UnitElectricCurrent>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.batteryCurrentAC`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitElectricCurrent>(value: -0.6, unit: .amperes))
    }
    
    func testBatteryCurrentDC() {
        let bytes: [UInt8] = [0x05, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x09, 0x00, 0xbf, 0xe3, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33]
        
        guard let property: AAProperty<Measurement<UnitElectricCurrent>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.batteryCurrentDC`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitElectricCurrent>(value: -0.6, unit: .amperes))
    }
    
    func testChargerVoltageAC() {
        let bytes: [UInt8] = [0x06, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x0a, 0x00, 0x40, 0x79, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let property: AAProperty<Measurement<UnitElectricPotentialDifference>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.chargerVoltageAC`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitElectricPotentialDifference>(value: 400, unit: .volts))
    }
    
    func testChargerVoltageDC() {
        let bytes: [UInt8] = [0x07, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x0a, 0x00, 0x40, 0x79, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let property: AAProperty<Measurement<UnitElectricPotentialDifference>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.chargerVoltageDC`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitElectricPotentialDifference>(value: 400, unit: .volts))
    }
    
    func testChargingRateKW() {
        let bytes: [UInt8] = [0x0a, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x14, 0x02, 0x40, 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let property: AAProperty<Measurement<UnitPower>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.chargingRateKW`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitPower>(value: 3.5, unit: .kilowatts))
    }


    // MARK: Getters
    
    func testGetChargingState() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x00]
        
        XCTAssertEqual(bytes, AACharging.getChargingState())
    }
    
    func testGetChargingStateAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x02]
        
        XCTAssertEqual(bytes, AACharging.getChargingStateAvailability())
    }
    
    func testGetChargingStateProperties() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x00, 0x02]
        let getterBytes = AACharging.getChargingStateProperties(ids: .estimatedRange)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetChargingStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x02, 0x02]
        let getterBytes = AACharging.getChargingStatePropertiesAvailability(ids: .estimatedRange)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Setters
    
    func testStartStopCharging() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x17, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AACharging.startStopCharging(status: AAChargingStatus.charging)
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testSetChargeLimit() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x08, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xec, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcd]
        let setterBytes = AACharging.setChargeLimit(chargeLimit: 0.9)
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testOpenCloseChargingPort() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x0b, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AACharging.openCloseChargingPort(chargePortState: AAPosition.open)
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testSetChargeMode() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x0c, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AACharging.setChargeMode(chargeMode: AAChargingChargeMode.timerBased)
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testSetChargingTimers() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x15, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x59, 0x89, 0x38, 0xe7, 0x88, 0x15, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x01, 0x00, 0x00, 0x01, 0x59, 0x89, 0x3c, 0x91, 0x08, 0x15, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x02, 0x00, 0x00, 0x01, 0x59, 0x89, 0x3c, 0x91, 0x08]
        let setterBytes = AACharging.setChargingTimers(timers: [AATimer(timerType: .preferredStartTime, date: DateFormatter.hmFormatter.date(from: "2017-01-10T16:32:05.000Z")!), AATimer(timerType: .preferredEndTime, date: DateFormatter.hmFormatter.date(from: "2017-01-10T16:36:05.000Z")!), AATimer(timerType: .departureDate, date: DateFormatter.hmFormatter.date(from: "2017-01-10T16:36:05.000Z")!)])
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testSetReductionOfChargingCurrentTimes() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x23, 0x01, 0x13, 0x00, 0x06, 0x01, 0x00, 0x03, 0x00, 0x11, 0x21, 0x13, 0x00, 0x06, 0x01, 0x00, 0x03, 0x01, 0x0c, 0x34]
        let setterBytes = AACharging.setReductionOfChargingCurrentTimes(reductionTimes: [AAReductionTime(startStop: .start, time: AATime(hour: 17, minute: 33)), AAReductionTime(startStop: .stop, time: AATime(hour: 12, minute: 52))])
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AACharging.identifier, 0x0023)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AACharging.PropertyIdentifier.estimatedRange.rawValue, 0x02)
        XCTAssertEqual(AACharging.PropertyIdentifier.batteryLevel.rawValue, 0x03)
        XCTAssertEqual(AACharging.PropertyIdentifier.chargeLimit.rawValue, 0x08)
        XCTAssertEqual(AACharging.PropertyIdentifier.timeToCompleteCharge.rawValue, 0x09)
        XCTAssertEqual(AACharging.PropertyIdentifier.chargePortState.rawValue, 0x0b)
        XCTAssertEqual(AACharging.PropertyIdentifier.chargeMode.rawValue, 0x0c)
        XCTAssertEqual(AACharging.PropertyIdentifier.maxChargingCurrent.rawValue, 0x0e)
        XCTAssertEqual(AACharging.PropertyIdentifier.plugType.rawValue, 0x0f)
        XCTAssertEqual(AACharging.PropertyIdentifier.chargingWindowChosen.rawValue, 0x10)
        XCTAssertEqual(AACharging.PropertyIdentifier.departureTimes.rawValue, 0x11)
        XCTAssertEqual(AACharging.PropertyIdentifier.reductionTimes.rawValue, 0x13)
        XCTAssertEqual(AACharging.PropertyIdentifier.batteryTemperature.rawValue, 0x14)
        XCTAssertEqual(AACharging.PropertyIdentifier.timers.rawValue, 0x15)
        XCTAssertEqual(AACharging.PropertyIdentifier.pluggedIn.rawValue, 0x16)
        XCTAssertEqual(AACharging.PropertyIdentifier.status.rawValue, 0x17)
        XCTAssertEqual(AACharging.PropertyIdentifier.chargingRate.rawValue, 0x18)
        XCTAssertEqual(AACharging.PropertyIdentifier.batteryCurrent.rawValue, 0x19)
        XCTAssertEqual(AACharging.PropertyIdentifier.chargerVoltage.rawValue, 0x1a)
        XCTAssertEqual(AACharging.PropertyIdentifier.currentType.rawValue, 0x1b)
        XCTAssertEqual(AACharging.PropertyIdentifier.maxRange.rawValue, 0x1c)
        XCTAssertEqual(AACharging.PropertyIdentifier.starterBatteryState.rawValue, 0x1d)
        XCTAssertEqual(AACharging.PropertyIdentifier.smartChargingStatus.rawValue, 0x1e)
        XCTAssertEqual(AACharging.PropertyIdentifier.batteryLevelAtDeparture.rawValue, 0x1f)
        XCTAssertEqual(AACharging.PropertyIdentifier.preconditioningDepartureStatus.rawValue, 0x20)
        XCTAssertEqual(AACharging.PropertyIdentifier.preconditioningImmediateStatus.rawValue, 0x21)
        XCTAssertEqual(AACharging.PropertyIdentifier.preconditioningDepartureEnabled.rawValue, 0x22)
        XCTAssertEqual(AACharging.PropertyIdentifier.preconditioningError.rawValue, 0x23)
        XCTAssertEqual(AACharging.PropertyIdentifier.batteryCapacity.rawValue, 0x24)
    }
}
