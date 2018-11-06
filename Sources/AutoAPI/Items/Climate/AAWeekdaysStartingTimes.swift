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
//  AAWeekdaysTimes.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 30/11/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct AAWeekdaysStartingTimes {

    public let monday: AATime
    public let tuesday: AATime
    public let wednesday: AATime
    public let thursday: AATime
    public let friday: AATime
    public let saturday: AATime
    public let sunday: AATime


    // MARK: Init

    public init(monday: AATime, tuesday: AATime, wednesday: AATime, thursday: AATime, friday: AATime, saturday: AATime, sunday: AATime) {
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
    }
}

extension AAWeekdaysStartingTimes: AABinaryInitable {

    init?<C>(_ binary: C) where C : Collection, C.Element == UInt8 {
        guard binary.count == 14 else {
            return nil
        }

        let bytes = binary.bytes

        guard let monday = AATime(bytes),
            let tuesday = AATime(bytes.suffix(from: 2)),
            let wednesday = AATime(bytes.suffix(from: 4)),
            let thursday = AATime(bytes.suffix(from: 6)),
            let friday = AATime(bytes.suffix(from: 8)),
            let saturday = AATime(bytes.suffix(from: 10)),
            let sunday = AATime(bytes.suffix(from: 12)) else {
                return nil
        }

        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
    }
}

extension AAWeekdaysStartingTimes: AAPropertyConvertable {

    var propertyValue: [UInt8] {
        return [monday.hour, monday.minute,
                tuesday.hour, tuesday.minute,
                wednesday.hour, wednesday.minute,
                thursday.hour, thursday.minute,
                friday.hour, friday.minute,
                saturday.hour, saturday.minute,
                sunday.hour, sunday.minute]
    }
}