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
//  AAVehicleInformationTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAVehicleInformationTests: XCTestCase {

    // MARK: State Properties
    
    func testPowertrain() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.powertrain?.value, AAEngineType.allElectric)
    }
    
    func testModelName() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x03, 0x00, 0x09, 0x01, 0x00, 0x06, 0x54, 0x79, 0x70, 0x65, 0x20, 0x58]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.modelName?.value, "Type X")
    }
    
    func testName() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x04, 0x00, 0x09, 0x01, 0x00, 0x06, 0x53, 0x70, 0x65, 0x65, 0x64, 0x79]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.name?.value, "Speedy")
    }
    
    func testLicensePlate() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x05, 0x00, 0x09, 0x01, 0x00, 0x06, 0x41, 0x42, 0x43, 0x31, 0x32, 0x33]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.licensePlate?.value, "ABC123")
    }
    
    func testSalesDesignation() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x06, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x50, 0x61, 0x63, 0x6b, 0x61, 0x67, 0x65, 0x2b]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.salesDesignation?.value, "Package+")
    }
    
    func testModelYear() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x07, 0x00, 0x05, 0x01, 0x00, 0x02, 0x07, 0xe3]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.modelYear?.value, 2019)
    }
    
    func testColourName() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x08, 0x00, 0x0f, 0x01, 0x00, 0x0c, 0x45, 0x73, 0x74, 0x6f, 0x72, 0x69, 0x6c, 0x20, 0x42, 0x6c, 0x61, 0x75]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.colourName?.value, "Estoril Blau")
    }
    
    func testNumberOfDoors() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x0a, 0x00, 0x04, 0x01, 0x00, 0x01, 0x05]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.numberOfDoors?.value, 5)
    }
    
    func testNumberOfSeats() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x0b, 0x00, 0x04, 0x01, 0x00, 0x01, 0x05]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.numberOfSeats?.value, 5)
    }
    
    func testEngineVolume() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x0c, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x19, 0x02, 0x40, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.engineVolume?.value, Measurement<UnitVolume>(value: 2.5, unit: .liters))
    }
    
    func testEngineMaxTorque() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x0d, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x18, 0x00, 0x40, 0x6e, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.engineMaxTorque?.value, Measurement<UnitTorque>(value: 245.0, unit: .newtonMeters))
    }
    
    func testGearbox() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x0e, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.gearbox?.value, AAVehicleInformationGearbox.automatic)
    }
    
    func testDisplayUnit() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x0f, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.displayUnit?.value, AAVehicleInformationDisplayUnit.km)
    }
    
    func testDriverSeatLocation() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x10, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.driverSeatLocation?.value, AAVehicleInformationDriverSeatLocation.left)
    }
    
    func testEquipments() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x11, 0x00, 0x12, 0x01, 0x00, 0x0f, 0x50, 0x61, 0x72, 0x6b, 0x69, 0x6e, 0x67, 0x20, 0x73, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x73, 0x11, 0x00, 0x13, 0x01, 0x00, 0x10, 0x41, 0x75, 0x74, 0x6f, 0x6d, 0x61, 0x74, 0x69, 0x63, 0x20, 0x77, 0x69, 0x70, 0x65, 0x72, 0x73]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        guard let equipments = capability.equipments?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.equipments` values from `AAVehicleInformation` capability")
        }
        
        XCTAssertTrue(equipments.contains { $0 == "Parking sensors" })
        XCTAssertTrue(equipments.contains { $0 == "Automatic wipers" })
    }
    
    func testPower() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x13, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x14, 0x02, 0x40, 0x6b, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.power?.value, Measurement<UnitPower>(value: 220.0, unit: .kilowatts))
    }
    
    func testLanguage() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x14, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x65, 0x73, 0x74, 0x6f, 0x6e, 0x69, 0x61, 0x6e]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.language?.value, "estonian")
    }
    
    func testTimeformat() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x15, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.timeformat?.value, AAVehicleInformationTimeformat.twentyFourH)
    }
    
    func testDrive() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x16, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.drive?.value, AAVehicleInformationDrive.rwd)
    }
    
    func testPowertrainSecondary() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x01, 0x17, 0x00, 0x04, 0x01, 0x00, 0x01, 0x06]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAVehicleInformation else {
            return XCTFail("Could not parse bytes as `AAVehicleInformation`")
        }
        
        XCTAssertEqual(capability.powertrainSecondary?.value, AAEngineType.petrol)
    }


    // MARK: Non-state or Deprecated Properties
    
    func testPowerInKW() {
        let bytes: [UInt8] = [0x09, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x14, 0x02, 0x40, 0x6b, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let property: AAProperty<Measurement<UnitPower>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.powerInKW`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitPower>(value: 220.0, unit: .kilowatts))
    }


    // MARK: Getters
    
    func testGetVehicleInformation() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x00]
        
        XCTAssertEqual(bytes, AAVehicleInformation.getVehicleInformation())
    }
    
    func testGetVehicleInformationProperties() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x14, 0x00, 0x02]
        let getterBytes = AAVehicleInformation.getVehicleInformationProperties(ids: .powertrain)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAVehicleInformation.identifier, 0x0014)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.powertrain.rawValue, 0x02)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.modelName.rawValue, 0x03)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.name.rawValue, 0x04)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.licensePlate.rawValue, 0x05)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.salesDesignation.rawValue, 0x06)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.modelYear.rawValue, 0x07)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.colourName.rawValue, 0x08)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.numberOfDoors.rawValue, 0x0a)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.numberOfSeats.rawValue, 0x0b)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.engineVolume.rawValue, 0x0c)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.engineMaxTorque.rawValue, 0x0d)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.gearbox.rawValue, 0x0e)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.displayUnit.rawValue, 0x0f)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.driverSeatLocation.rawValue, 0x10)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.equipments.rawValue, 0x11)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.power.rawValue, 0x13)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.language.rawValue, 0x14)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.timeformat.rawValue, 0x15)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.drive.rawValue, 0x16)
        XCTAssertEqual(AAVehicleInformation.PropertyIdentifier.powertrainSecondary.rawValue, 0x17)
    }
}
