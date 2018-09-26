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
//  FirmwareVersion.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 28/11/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct FirmwareVersion: AAInboundCommand {

    public let applicationVersion: String?
    public let hmkitVersion: SDKVersion?
    public let hmkitBuildName: String?


    @available(*, deprecated, renamed: "hmkitVersion")
    public var carSDKVersion: SDKVersion? {
        return hmkitVersion
    }

    @available(*, deprecated, renamed: "hmkitBuildName")
    public var carSDKBuildName: String? {
        return hmkitBuildName
    }


    // MARK: AAInboundCommand

    public let properties: AAProperties


    init?(_ messageType: UInt8, properties: AAProperties) {
        guard messageType == 0x01 else {
            return nil
        }

        // Ordered by the ID
        hmkitVersion = SDKVersion(properties.first(for: 0x01)?.value ?? [])
        hmkitBuildName = properties.value(for: 0x02)
        applicationVersion = properties.value(for: 0x03)

        // Properties
        self.properties = properties
    }
}

extension FirmwareVersion: AAIdentifiable {

    public static var identifier: AACommandIdentifier = AACommandIdentifier(0x0003)
}

extension FirmwareVersion: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case getVersion = 0x00
        case version    = 0x01
    }
}

public extension FirmwareVersion {

    static var getVersion: [UInt8] {
        return commandPrefix(for: .getVersion)
    }
}
