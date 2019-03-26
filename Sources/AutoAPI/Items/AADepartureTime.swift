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
//  AADepartureTime.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 18/09/2018.
//  Copyright © 2019 High Mobility GmbH. All rights reserved.
//

import Foundation


public struct AADepartureTime {

    public let state: AAActiveState
    public let time: AATime?
}

extension AADepartureTime: AABytesConvertable {

    public var bytes: [UInt8] {
        return state.bytes + (time?.bytes ?? [])
    }


    public init?(bytes: [UInt8]) {
        guard bytes.count == 3 else {
            return nil
        }
        
        guard let activeState = AAActiveState(bytes: bytes[0..<1]) else {
            return nil
        }

        state = activeState

        if (bytes[1] == 0xFF) || (bytes[2] == 0xFF) {
            time = nil
        }
        else {
            time = AATime(bytes: bytes[1...])
        }
    }
}