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
//  AAVideoHandover.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 13/12/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct AAVideoHandover: AAOutboundCommand {

}

extension AAVideoHandover: AAIdentifiable {

    public static var identifier: AACommandIdentifier = 0x0043
}

extension AAVideoHandover: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case handover  = 0x00
    }
}


// MARK: Commands

public extension AAVideoHandover {

    static func videoHandover(url: URL, startingSecond second: UInt16?, screen: AAScreen?) -> [UInt8] {
        return commandPrefix(for: .handover) + [url.propertyBytes(0x01),
                                                second?.propertyBytes(0x02),
                                                screen?.propertyBytes(0x03)].propertiesValuesCombined
    }
}

public extension AAVideoHandover {

    struct Legacy: AAMessageTypesGettable {

        public enum MessageTypes: UInt8, CaseIterable {

            case handover  = 0x00
        }
        

        struct Details {
            public let videoURL: URL
            public let startingSecond: UInt16?
            public let screen: AAScreen?

            public init(videoURL: URL, startingSecond: UInt16?, screen: AAScreen?) {
                self.videoURL = videoURL
                self.startingSecond = startingSecond
                self.screen = screen
            }
        }


        static var videoHandover: (Details) -> [UInt8] {
            return {
                let urlBytes = $0.videoURL.propertyBytes(0x01)
                let secondBytes: [UInt8] = $0.startingSecond?.propertyBytes(0x02) ?? []
                let screenBytes: [UInt8] = $0.screen?.propertyBytes(0x03) ?? []

                return commandPrefix(for: AAVideoHandover.self, messageType: .handover) + urlBytes + secondBytes + screenBytes
            }
        }
    }
}