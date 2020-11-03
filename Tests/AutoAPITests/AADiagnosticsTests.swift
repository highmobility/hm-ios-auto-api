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
//  AADiagnosticsTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AADiagnosticsTests: XCTestCase {

    // MARK: State Properties
    
    func testEngineOilTemperature() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x02, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x17, 0x01, 0x40, 0x58, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.engineOilTemperature?.value, Measurement<UnitTemperature>(value: 99.5, unit: .celsius))
    }
    
    func testSpeed() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x03, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x16, 0x01, 0x40, 0x4e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.speed?.value, Measurement<UnitSpeed>(value: 60.0, unit: .kilometersPerHour))
    }
    
    func testEngineRPM() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x04, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x03, 0x00, 0x40, 0xa3, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.engineRPM?.value, Measurement<UnitAngularVelocity>(value: 2500.0, unit: .revolutionsPerMinute))
    }
    
    func testFuelLevel() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x05, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xec, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcd]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.fuelLevel?.value, 0.9)
    }
    
    func testEstimatedRange() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x06, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x04, 0x40, 0x70, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.estimatedRange?.value, Measurement<UnitLength>(value: 265.0, unit: .kilometers))
    }
    
    func testWasherFluidLevel() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x09, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.washerFluidLevel?.value, .filled)
    }
    
    func testBatteryVoltage() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x0b, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x0a, 0x00, 0x40, 0x28, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.batteryVoltage?.value, Measurement<UnitElectricPotentialDifference>(value: 12.1, unit: .volts))
    }
    
    func testAdBlueLevel() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x0c, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x19, 0x02, 0x3f, 0xe1, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.adBlueLevel?.value, Measurement<UnitVolume>(value: 0.55, unit: .liters))
    }
    
    func testDistanceSinceReset() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x0d, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x04, 0x40, 0x97, 0x70, 0x66, 0x66, 0x66, 0x66, 0x66]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.distanceSinceReset?.value, Measurement<UnitLength>(value: 1500.1, unit: .kilometers))
    }
    
    func testDistanceSinceStart() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x0e, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x04, 0x40, 0x28, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcd]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.distanceSinceStart?.value, Measurement<UnitLength>(value: 12.4, unit: .kilometers))
    }
    
    func testFuelVolume() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x0f, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x19, 0x02, 0x40, 0x41, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.fuelVolume?.value, Measurement<UnitVolume>(value: 35.5, unit: .liters))
    }
    
    func testAntiLockBraking() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x10, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.antiLockBraking?.value, .active)
    }
    
    func testEngineCoolantTemperature() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x11, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x17, 0x01, 0x40, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.engineCoolantTemperature?.value, Measurement<UnitTemperature>(value: 20.0, unit: .celsius))
    }
    
    func testEngineTotalFuelConsumption() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x13, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x19, 0x02, 0x40, 0xda, 0xf0, 0xc0, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.engineTotalFuelConsumption?.value, Measurement<UnitVolume>(value: 27587.0, unit: .liters))
    }
    
    func testBrakeFluidLevel() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x14, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.brakeFluidLevel?.value, .low)
    }
    
    func testEngineTorque() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x15, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xc9, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.engineTorque?.value, 0.2)
    }
    
    func testEngineLoad() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x16, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xb9, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.engineLoad?.value, 0.1)
    }
    
    func testWheelBasedSpeed() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x17, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x16, 0x01, 0x40, 0x50, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.wheelBasedSpeed?.value, Measurement<UnitSpeed>(value: 65.0, unit: .kilometersPerHour))
    }
    
    func testBatteryLevel() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x18, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xe1, 0xeb, 0x85, 0x1e, 0xb8, 0x51, 0xec]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.batteryLevel?.value, 0.56)
    }
    
    func testCheckControlMessages() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x19, 0x00, 0x24, 0x01, 0x00, 0x21, 0x00, 0x01, 0x07, 0x01, 0x40, 0xf9, 0xc7, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0c, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x20, 0x65, 0x6e, 0x67, 0x69, 0x6e, 0x65, 0x00, 0x05, 0x41, 0x6c, 0x65, 0x72, 0x74]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        guard let checkControlMessages = capability.checkControlMessages?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.checkControlMessages` values from `AADiagnostics` capability")
        }
        
        XCTAssertTrue(checkControlMessages.contains { $0.bytes == AACheckControlMessage(ID: 1, remainingTime: Measurement<UnitDuration>(value: 105592.0, unit: UnitDuration.minutes), text: "Check engine", status: "Alert").bytes })
    }
    
    func testTirePressures() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x1a, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x00, 0x15, 0x06, 0x40, 0x02, 0x7a, 0xe1, 0x47, 0xae, 0x14, 0x7b, 0x1a, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x01, 0x15, 0x06, 0x40, 0x02, 0x7a, 0xe1, 0x47, 0xae, 0x14, 0x7b, 0x1a, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x02, 0x15, 0x06, 0x40, 0x01, 0xeb, 0x85, 0x1e, 0xb8, 0x51, 0xec, 0x1a, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x03, 0x15, 0x06, 0x40, 0x01, 0xeb, 0x85, 0x1e, 0xb8, 0x51, 0xec, 0x1a, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x04, 0x15, 0x06, 0x40, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x05, 0x15, 0x06, 0x40, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        guard let tirePressures = capability.tirePressures?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.tirePressures` values from `AADiagnostics` capability")
        }
        
        XCTAssertTrue(tirePressures.contains { $0.bytes == AATirePressure(location: .frontLeft, pressure: Measurement<UnitPressure>(value: 2.31, unit: UnitPressure.bars)).bytes })
        XCTAssertTrue(tirePressures.contains { $0.bytes == AATirePressure(location: .frontRight, pressure: Measurement<UnitPressure>(value: 2.31, unit: UnitPressure.bars)).bytes })
        XCTAssertTrue(tirePressures.contains { $0.bytes == AATirePressure(location: .rearRight, pressure: Measurement<UnitPressure>(value: 2.24, unit: UnitPressure.bars)).bytes })
        XCTAssertTrue(tirePressures.contains { $0.bytes == AATirePressure(location: .rearLeft, pressure: Measurement<UnitPressure>(value: 2.24, unit: UnitPressure.bars)).bytes })
        XCTAssertTrue(tirePressures.contains { $0.bytes == AATirePressure(location: .rearRightOuter, pressure: Measurement<UnitPressure>(value: 2.25, unit: UnitPressure.bars)).bytes })
        XCTAssertTrue(tirePressures.contains { $0.bytes == AATirePressure(location: .rearLeftOuter, pressure: Measurement<UnitPressure>(value: 2.25, unit: UnitPressure.bars)).bytes })
    }
    
    func testTireTemperatures() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x1b, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x00, 0x17, 0x01, 0x40, 0x44, 0x0c, 0xcc, 0xcc, 0xcc, 0xcc, 0xcd, 0x1b, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x01, 0x17, 0x01, 0x40, 0x44, 0x19, 0x99, 0x99, 0x99, 0x99, 0x9a, 0x1b, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x02, 0x17, 0x01, 0x40, 0x44, 0x26, 0x66, 0x66, 0x66, 0x66, 0x66, 0x1b, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x03, 0x17, 0x01, 0x40, 0x44, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x1b, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x04, 0x17, 0x01, 0x40, 0x44, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x05, 0x17, 0x01, 0x40, 0x44, 0x4c, 0xcc, 0xcc, 0xcc, 0xcc, 0xcd]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        guard let tireTemperatures = capability.tireTemperatures?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.tireTemperatures` values from `AADiagnostics` capability")
        }
        
        XCTAssertTrue(tireTemperatures.contains { $0.bytes == AATireTemperature(location: .frontLeft, temperature: Measurement<UnitTemperature>(value: 40.1, unit: UnitTemperature.celsius)).bytes })
        XCTAssertTrue(tireTemperatures.contains { $0.bytes == AATireTemperature(location: .frontRight, temperature: Measurement<UnitTemperature>(value: 40.2, unit: UnitTemperature.celsius)).bytes })
        XCTAssertTrue(tireTemperatures.contains { $0.bytes == AATireTemperature(location: .rearRight, temperature: Measurement<UnitTemperature>(value: 40.3, unit: UnitTemperature.celsius)).bytes })
        XCTAssertTrue(tireTemperatures.contains { $0.bytes == AATireTemperature(location: .rearLeft, temperature: Measurement<UnitTemperature>(value: 40.4, unit: UnitTemperature.celsius)).bytes })
        XCTAssertTrue(tireTemperatures.contains { $0.bytes == AATireTemperature(location: .rearRightOuter, temperature: Measurement<UnitTemperature>(value: 40.5, unit: UnitTemperature.celsius)).bytes })
        XCTAssertTrue(tireTemperatures.contains { $0.bytes == AATireTemperature(location: .rearLeftOuter, temperature: Measurement<UnitTemperature>(value: 40.6, unit: UnitTemperature.celsius)).bytes })
    }
    
    func testWheelRPMs() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x1c, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x00, 0x03, 0x00, 0x40, 0x87, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x01, 0x03, 0x00, 0x40, 0x87, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x02, 0x03, 0x00, 0x40, 0x88, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x03, 0x03, 0x00, 0x40, 0x88, 0x98, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x04, 0x03, 0x00, 0x40, 0x88, 0xe8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x05, 0x03, 0x00, 0x40, 0x89, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        guard let wheelRPMs = capability.wheelRPMs?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.wheelRPMs` values from `AADiagnostics` capability")
        }
        
        XCTAssertTrue(wheelRPMs.contains { $0.bytes == AAWheelRPM(location: .frontLeft, RPM: Measurement<UnitAngularVelocity>(value: 737.0, unit: UnitAngularVelocity.revolutionsPerMinute)).bytes })
        XCTAssertTrue(wheelRPMs.contains { $0.bytes == AAWheelRPM(location: .frontRight, RPM: Measurement<UnitAngularVelocity>(value: 747.0, unit: UnitAngularVelocity.revolutionsPerMinute)).bytes })
        XCTAssertTrue(wheelRPMs.contains { $0.bytes == AAWheelRPM(location: .rearRight, RPM: Measurement<UnitAngularVelocity>(value: 777.0, unit: UnitAngularVelocity.revolutionsPerMinute)).bytes })
        XCTAssertTrue(wheelRPMs.contains { $0.bytes == AAWheelRPM(location: .rearLeft, RPM: Measurement<UnitAngularVelocity>(value: 787.0, unit: UnitAngularVelocity.revolutionsPerMinute)).bytes })
        XCTAssertTrue(wheelRPMs.contains { $0.bytes == AAWheelRPM(location: .rearRightOuter, RPM: Measurement<UnitAngularVelocity>(value: 797.0, unit: UnitAngularVelocity.revolutionsPerMinute)).bytes })
        XCTAssertTrue(wheelRPMs.contains { $0.bytes == AAWheelRPM(location: .rearLeftOuter, RPM: Measurement<UnitAngularVelocity>(value: 807.0, unit: UnitAngularVelocity.revolutionsPerMinute)).bytes })
    }
    
    func testTroubleCodes() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x1d, 0x00, 0x22, 0x01, 0x00, 0x1f, 0x02, 0x00, 0x07, 0x43, 0x31, 0x31, 0x31, 0x36, 0x46, 0x41, 0x00, 0x09, 0x52, 0x44, 0x55, 0x5f, 0x32, 0x31, 0x32, 0x46, 0x52, 0x00, 0x07, 0x50, 0x45, 0x4e, 0x44, 0x49, 0x4e, 0x47, 0x00, 0x1d, 0x00, 0x1f, 0x01, 0x00, 0x1c, 0x02, 0x00, 0x07, 0x43, 0x31, 0x36, 0x33, 0x41, 0x46, 0x41, 0x00, 0x06, 0x44, 0x54, 0x52, 0x32, 0x31, 0x32, 0x00, 0x07, 0x50, 0x45, 0x4e, 0x44, 0x49, 0x4e, 0x47, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        guard let troubleCodes = capability.troubleCodes?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.troubleCodes` values from `AADiagnostics` capability")
        }
        
        XCTAssertTrue(troubleCodes.contains { $0.bytes == AATroubleCode(occurrences: 2, ID: "C1116FA", ecuID: "RDU_212FR", status: "PENDING", system: .unknown).bytes })
        XCTAssertTrue(troubleCodes.contains { $0.bytes == AATroubleCode(occurrences: 2, ID: "C163AFA", ecuID: "DTR212", status: "PENDING", system: .body).bytes })
    }
    
    func testOdometer() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x1f, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x05, 0x40, 0x19, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.odometer?.value, Measurement<UnitLength>(value: 6.4, unit: .megameters))
    }
    
    func testEngineTotalOperatingTime() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x20, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x07, 0x02, 0x40, 0x97, 0x72, 0x99, 0x99, 0x99, 0x99, 0x9a]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.engineTotalOperatingTime?.value, Measurement<UnitDuration>(value: 1500.65, unit: .hours))
    }
    
    func testTirePressureStatuses() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x21, 0x00, 0x05, 0x01, 0x00, 0x02, 0x00, 0x00, 0x21, 0x00, 0x05, 0x01, 0x00, 0x02, 0x01, 0x01, 0x21, 0x00, 0x05, 0x01, 0x00, 0x02, 0x02, 0x02, 0x21, 0x00, 0x05, 0x01, 0x00, 0x02, 0x03, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        guard let tirePressureStatuses = capability.tirePressureStatuses?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.tirePressureStatuses` values from `AADiagnostics` capability")
        }
        
        XCTAssertTrue(tirePressureStatuses.contains { $0.bytes == AATirePressureStatus(location: .frontLeft, status: .normal).bytes })
        XCTAssertTrue(tirePressureStatuses.contains { $0.bytes == AATirePressureStatus(location: .frontRight, status: .low).bytes })
        XCTAssertTrue(tirePressureStatuses.contains { $0.bytes == AATirePressureStatus(location: .rearRight, status: .alert).bytes })
        XCTAssertTrue(tirePressureStatuses.contains { $0.bytes == AATirePressureStatus(location: .rearLeft, status: .normal).bytes })
    }
    
    func testBrakeLiningWearPreWarning() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x22, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.brakeLiningWearPreWarning?.value, .inactive)
    }
    
    func testEngineOilLifeRemaining() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x23, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xec, 0x28, 0xf5, 0xc2, 0x8f, 0x5c, 0x29]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.engineOilLifeRemaining?.value, 0.88)
    }
    
    func testOemTroubleCodeValues() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x24, 0x00, 0x24, 0x01, 0x00, 0x21, 0x00, 0x05, 0x31, 0x32, 0x33, 0x49, 0x44, 0x00, 0x18, 0x00, 0x0a, 0x73, 0x6f, 0x6d, 0x65, 0x5f, 0x65, 0x72, 0x72, 0x6f, 0x72, 0x00, 0x0a, 0x73, 0x6f, 0x6d, 0x65, 0x5f, 0x76, 0x61, 0x6c, 0x75, 0x65, 0x24, 0x00, 0x2d, 0x01, 0x00, 0x2a, 0x00, 0x04, 0x31, 0x42, 0x33, 0x43, 0x00, 0x22, 0x00, 0x0f, 0x69, 0x6d, 0x70, 0x6f, 0x72, 0x74, 0x61, 0x6e, 0x74, 0x5f, 0x65, 0x72, 0x72, 0x6f, 0x72, 0x00, 0x0f, 0x73, 0x79, 0x73, 0x74, 0x65, 0x6d, 0x20, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x20, 0x33, 0x32]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        guard let oemTroubleCodeValues = capability.oemTroubleCodeValues?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.oemTroubleCodeValues` values from `AADiagnostics` capability")
        }
        
        XCTAssertTrue(oemTroubleCodeValues.contains { $0.bytes == AAOemTroubleCodeValue(ID: "123ID", keyValue: AAKeyValue(key: "some_error", value: "some_value")).bytes })
        XCTAssertTrue(oemTroubleCodeValues.contains { $0.bytes == AAOemTroubleCodeValue(ID: "1B3C", keyValue: AAKeyValue(key: "important_error", value: "system fault 32")).bytes })
    }
    
    func testDieselExhaustFluidRange() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x25, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x04, 0x40, 0xa1, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.dieselExhaustFluidRange?.value, Measurement<UnitLength>(value: 2233.0, unit: .kilometers))
    }
    
    func testDieselParticulateFilterSootLevel() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x26, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xc4, 0x7a, 0xe1, 0x47, 0xae, 0x14, 0x7b]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.dieselParticulateFilterSootLevel?.value, 0.16)
    }
    
    func testConfirmedTroubleCodes() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x27, 0x00, 0x1c, 0x01, 0x00, 0x19, 0x00, 0x06, 0x38, 0x30, 0x31, 0x43, 0x31, 0x30, 0x00, 0x02, 0x31, 0x36, 0x00, 0x03, 0x43, 0x41, 0x53, 0x00, 0x06, 0x41, 0x43, 0x54, 0x49, 0x56, 0x45, 0x27, 0x00, 0x1c, 0x01, 0x00, 0x19, 0x00, 0x06, 0x44, 0x35, 0x32, 0x43, 0x34, 0x34, 0x00, 0x02, 0x34, 0x38, 0x00, 0x03, 0x43, 0x41, 0x53, 0x00, 0x06, 0x41, 0x43, 0x54, 0x49, 0x56, 0x45]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        guard let confirmedTroubleCodes = capability.confirmedTroubleCodes?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.confirmedTroubleCodes` values from `AADiagnostics` capability")
        }
        
        XCTAssertTrue(confirmedTroubleCodes.contains { $0.bytes == AAConfirmedTroubleCode(ID: "801C10", ecuAddress: "16", ecuVariantName: "CAS", status: "ACTIVE").bytes })
        XCTAssertTrue(confirmedTroubleCodes.contains { $0.bytes == AAConfirmedTroubleCode(ID: "D52C44", ecuAddress: "48", ecuVariantName: "CAS", status: "ACTIVE").bytes })
    }
    
    func testDieselExhaustFilterStatus() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x01, 0x28, 0x00, 0x06, 0x01, 0x00, 0x03, 0x01, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADiagnostics else {
            return XCTFail("Could not parse bytes as `AADiagnostics`")
        }
        
        XCTAssertEqual(capability.dieselExhaustFilterStatus?.value?.bytes, AADieselExhaustFilterStatus(status: .normalOperation, component: .exhaustFilter, cleaning: .unknown).bytes)
    }


    // MARK: Non-state or Deprecated Properties
    
    func testMileage() {
        let bytes: [UInt8] = [0x01, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x04, 0x41, 0x02, 0x4f, 0x80, 0x00, 0x00, 0x00, 0x00]
        
        guard let property: AAProperty<Measurement<UnitLength>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.mileage`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitLength>(value: 150000.0, unit: .kilometers))
    }
    
    func testEngineTotalOperatingHours() {
        let bytes: [UInt8] = [0x12, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x07, 0x02, 0x40, 0x97, 0x72, 0x99, 0x99, 0x99, 0x99, 0x9a]
        
        guard let property: AAProperty<Measurement<UnitDuration>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.engineTotalOperatingHours`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitDuration>(value: 1500.65, unit: .hours))
    }
    
    func testMileageMeters() {
        let bytes: [UInt8] = [0x1e, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x12, 0x04, 0x41, 0x02, 0x4f, 0x88, 0x00, 0x00, 0x00, 0x00]
        
        guard let property: AAProperty<Measurement<UnitLength>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.mileageMeters`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitLength>(value: 150001.0, unit: .kilometers))
    }


    // MARK: Getters
    
    func testGetDiagnosticsState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x00]
        
        XCTAssertEqual(bytes, AADiagnostics.getDiagnosticsState())
    }
    
    func testGetDiagnosticsStateAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x02]
        
        XCTAssertEqual(bytes, AADiagnostics.getDiagnosticsStateAvailability())
    }
    
    func testGetDiagnosticsStateProperties() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x00, 0x02]
        let getterBytes = AADiagnostics.getDiagnosticsStateProperties(ids: .engineOilTemperature)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetDiagnosticsStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x33, 0x02, 0x02]
        let getterBytes = AADiagnostics.getDiagnosticsStatePropertiesAvailability(ids: .engineOilTemperature)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AADiagnostics.identifier, 0x0033)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.engineOilTemperature.rawValue, 0x02)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.speed.rawValue, 0x03)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.engineRPM.rawValue, 0x04)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.fuelLevel.rawValue, 0x05)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.estimatedRange.rawValue, 0x06)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.washerFluidLevel.rawValue, 0x09)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.batteryVoltage.rawValue, 0x0b)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.adBlueLevel.rawValue, 0x0c)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.distanceSinceReset.rawValue, 0x0d)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.distanceSinceStart.rawValue, 0x0e)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.fuelVolume.rawValue, 0x0f)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.antiLockBraking.rawValue, 0x10)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.engineCoolantTemperature.rawValue, 0x11)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.engineTotalFuelConsumption.rawValue, 0x13)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.brakeFluidLevel.rawValue, 0x14)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.engineTorque.rawValue, 0x15)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.engineLoad.rawValue, 0x16)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.wheelBasedSpeed.rawValue, 0x17)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.batteryLevel.rawValue, 0x18)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.checkControlMessages.rawValue, 0x19)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.tirePressures.rawValue, 0x1a)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.tireTemperatures.rawValue, 0x1b)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.wheelRPMs.rawValue, 0x1c)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.troubleCodes.rawValue, 0x1d)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.odometer.rawValue, 0x1f)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.engineTotalOperatingTime.rawValue, 0x20)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.tirePressureStatuses.rawValue, 0x21)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.brakeLiningWearPreWarning.rawValue, 0x22)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.engineOilLifeRemaining.rawValue, 0x23)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.oemTroubleCodeValues.rawValue, 0x24)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.dieselExhaustFluidRange.rawValue, 0x25)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.dieselParticulateFilterSootLevel.rawValue, 0x26)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.confirmedTroubleCodes.rawValue, 0x27)
        XCTAssertEqual(AADiagnostics.PropertyIdentifier.dieselExhaustFilterStatus.rawValue, 0x28)
    }
}