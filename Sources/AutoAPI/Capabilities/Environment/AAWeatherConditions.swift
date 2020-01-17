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
//  AAWeatherConditions.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 13/01/2020.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public class AAWeatherConditions: AACapability {

    /// Property Identifiers for `AAWeatherConditions` capability.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case rainIntensity = 0x01
    }


    // MARK: Properties
    
    /// Measured raining intensity percentage, whereas 0% is no rain and 100% is maximum rain
    ///
    /// - returns: `AAPercentage` wrapped in `AAProperty<AAPercentage>`
    public var rainIntensity: AAProperty<AAPercentage>? {
        properties.property(forID: PropertyIdentifier.rainIntensity)
    }


    // MARK: AAIdentifiable
    
    /// Capability's Identifier
    ///
    /// - returns: `UInt16` combining the MSB and LSB
    public override class var identifier: UInt16 {
        0x0055
    }


    // MARK: Getters
    
    /// Bytes for getting the `AAWeatherConditions` state.
    ///
    /// These bytes should be sent to a receiving vehicle (device) to *request* the state of `AAWeatherConditions`.
    ///
    /// - returns: Command's bytes as `Array<UInt8>`
    public static func getWeatherConditions() -> Array<UInt8> {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + [AACommandType.get.rawValue]
    }


    // MARK: AADebugTreeCapable
    
    public override var propertyNodes: [HMDebugTree] {
        [
            .node(label: "Rain intensity", property: rainIntensity)
        ]
    }
}