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
//  AARaceTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AARaceTests: XCTestCase {

    // MARK: State Properties
    
    func testAccelerations() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x01, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x00, 0x01, 0x01, 0x3f, 0xeb, 0xa5, 0xe3, 0x53, 0xf7, 0xce, 0xd9, 0x01, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x01, 0x01, 0x01, 0xbf, 0xe8, 0x18, 0x93, 0x74, 0xbc, 0x6a, 0x7f, 0x01, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x02, 0x01, 0x01, 0x3f, 0xe8, 0x18, 0x93, 0x74, 0xbc, 0x6a, 0x7f, 0x01, 0x00, 0x0e, 0x01, 0x00, 0x0b, 0x03, 0x01, 0x01, 0xbf, 0xeb, 0xa5, 0xe3, 0x53, 0xf7, 0xce, 0xd9]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        guard let accelerations = capability.accelerations?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.accelerations` values from `AARace` capability")
        }
        
        XCTAssertTrue(accelerations.contains { $0.bytes == AAAcceleration(direction: .longitudinal, acceleration: Measurement<UnitAcceleration>(value: 0.864, unit: UnitAcceleration.gravity)).bytes })
        XCTAssertTrue(accelerations.contains { $0.bytes == AAAcceleration(direction: .lateral, acceleration: Measurement<UnitAcceleration>(value: -0.753, unit: UnitAcceleration.gravity)).bytes })
        XCTAssertTrue(accelerations.contains { $0.bytes == AAAcceleration(direction: .frontLateral, acceleration: Measurement<UnitAcceleration>(value: 0.753, unit: UnitAcceleration.gravity)).bytes })
        XCTAssertTrue(accelerations.contains { $0.bytes == AAAcceleration(direction: .rearLateral, acceleration: Measurement<UnitAcceleration>(value: -0.864, unit: UnitAcceleration.gravity)).bytes })
    }
    
    func testUndersteering() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x02, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xc8, 0x51, 0xeb, 0x85, 0x1e, 0xb8, 0x52]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.understeering?.value, 0.19)
    }
    
    func testOversteering() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x03, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xa9, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.oversteering?.value, 0.05)
    }
    
    func testGasPedalPosition() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x04, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xef, 0x5c, 0x28, 0xf5, 0xc2, 0x8f, 0x5c]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.gasPedalPosition?.value, 0.98)
    }
    
    func testSteeringAngle() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x05, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x02, 0x00, 0x40, 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.steeringAngle?.value, Measurement<UnitAngle>(value: 10.0, unit: .degrees))
    }
    
    func testBrakePressure() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x06, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x15, 0x06, 0x40, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.brakePressure?.value, Measurement<UnitPressure>(value: 20.0, unit: .bars))
    }
    
    func testYawRate() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x07, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x03, 0x01, 0x40, 0x1a, 0xa3, 0xd7, 0x0a, 0x3d, 0x70, 0xa4]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.yawRate?.value, Measurement<UnitAngularVelocity>(value: 6.66, unit: .degreesPerSecond))
    }
    
    func testRearSuspensionSteering() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x08, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x02, 0x00, 0x40, 0x0a, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.rearSuspensionSteering?.value, Measurement<UnitAngle>(value: 3.3, unit: .degrees))
    }
    
    func testElectronicStabilityProgram() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x09, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.electronicStabilityProgram?.value, AAActiveState.active)
    }
    
    func testBrakeTorqueVectorings() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x0a, 0x00, 0x05, 0x01, 0x00, 0x02, 0x00, 0x01, 0x0a, 0x00, 0x05, 0x01, 0x00, 0x02, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        guard let brakeTorqueVectorings = capability.brakeTorqueVectorings?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.brakeTorqueVectorings` values from `AARace` capability")
        }
        
        XCTAssertTrue(brakeTorqueVectorings.contains { $0.bytes == AABrakeTorqueVectoring(axle: .front, state: .active).bytes })
        XCTAssertTrue(brakeTorqueVectorings.contains { $0.bytes == AABrakeTorqueVectoring(axle: .rear, state: .inactive).bytes })
    }
    
    func testGearMode() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x0b, 0x00, 0x04, 0x01, 0x00, 0x01, 0x04]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.gearMode?.value, AARaceGearMode.drive)
    }
    
    func testSelectedGear() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x0c, 0x00, 0x04, 0x01, 0x00, 0x01, 0x04]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.selectedGear?.value, 4)
    }
    
    func testBrakePedalPosition() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x0d, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xbe, 0xb8, 0x51, 0xeb, 0x85, 0x1e, 0xb8]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.brakePedalPosition?.value, 0.12)
    }
    
    func testBrakePedalSwitch() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x0e, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.brakePedalSwitch?.value, AAActiveState.active)
    }
    
    func testClutchPedalSwitch() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x0f, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.clutchPedalSwitch?.value, AAActiveState.active)
    }
    
    func testAcceleratorPedalIdleSwitch() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x10, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.acceleratorPedalIdleSwitch?.value, AAActiveState.active)
    }
    
    func testAcceleratorPedalKickdownSwitch() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x11, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.acceleratorPedalKickdownSwitch?.value, AAActiveState.active)
    }
    
    func testVehicleMoving() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x01, 0x12, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARace else {
            return XCTFail("Could not parse bytes as `AARace`")
        }
        
        XCTAssertEqual(capability.vehicleMoving?.value, AARaceVehicleMoving.moving)
    }


    // MARK: Getters
    
    func testGetRaceState() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x00]
        
        XCTAssertEqual(bytes, AARace.getRaceState())
    }
    
    func testGetRaceStateAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x02]
        
        XCTAssertEqual(bytes, AARace.getRaceStateAvailability())
    }
    
    func testGetRaceStateProperties() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x00, 0x01]
        let getterBytes = AARace.getRaceStateProperties(ids: .accelerations)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetRaceStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x57, 0x02, 0x01]
        let getterBytes = AARace.getRaceStatePropertiesAvailability(ids: .accelerations)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AARace.identifier, 0x0057)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AARace.PropertyIdentifier.accelerations.rawValue, 0x01)
        XCTAssertEqual(AARace.PropertyIdentifier.understeering.rawValue, 0x02)
        XCTAssertEqual(AARace.PropertyIdentifier.oversteering.rawValue, 0x03)
        XCTAssertEqual(AARace.PropertyIdentifier.gasPedalPosition.rawValue, 0x04)
        XCTAssertEqual(AARace.PropertyIdentifier.steeringAngle.rawValue, 0x05)
        XCTAssertEqual(AARace.PropertyIdentifier.brakePressure.rawValue, 0x06)
        XCTAssertEqual(AARace.PropertyIdentifier.yawRate.rawValue, 0x07)
        XCTAssertEqual(AARace.PropertyIdentifier.rearSuspensionSteering.rawValue, 0x08)
        XCTAssertEqual(AARace.PropertyIdentifier.electronicStabilityProgram.rawValue, 0x09)
        XCTAssertEqual(AARace.PropertyIdentifier.brakeTorqueVectorings.rawValue, 0x0a)
        XCTAssertEqual(AARace.PropertyIdentifier.gearMode.rawValue, 0x0b)
        XCTAssertEqual(AARace.PropertyIdentifier.selectedGear.rawValue, 0x0c)
        XCTAssertEqual(AARace.PropertyIdentifier.brakePedalPosition.rawValue, 0x0d)
        XCTAssertEqual(AARace.PropertyIdentifier.brakePedalSwitch.rawValue, 0x0e)
        XCTAssertEqual(AARace.PropertyIdentifier.clutchPedalSwitch.rawValue, 0x0f)
        XCTAssertEqual(AARace.PropertyIdentifier.acceleratorPedalIdleSwitch.rawValue, 0x10)
        XCTAssertEqual(AARace.PropertyIdentifier.acceleratorPedalKickdownSwitch.rawValue, 0x11)
        XCTAssertEqual(AARace.PropertyIdentifier.vehicleMoving.rawValue, 0x12)
    }
}
