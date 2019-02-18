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
//  AASpringRateValue.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 13/12/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct AASpringRateValue {

    public let axle: AAAxle
    public let value: UInt8


    init(axle: AAAxle, value: UInt8) {
        self.axle = axle
        self.value = value
    }
}

extension AASpringRateValue: AABytesConvertable {

    public var bytes: [UInt8] {
        return axle.bytes + value.bytes
    }


    public init?(bytes: [UInt8]) {
        guard bytes.count == 2 else {
            return nil
        }

        guard let axle = AAAxle(bytes: bytes[0..<1]) else {
            return nil
        }

        self.init(axle: axle, value: bytes[1])
    }
}