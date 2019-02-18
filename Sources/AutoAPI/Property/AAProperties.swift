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
//  AAProperties.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 12/02/2019.
//  Copyright © 2019 High Mobility GmbH. All rights reserved.
//

import Foundation


public struct AAProperties: Sequence, IteratorProtocol, AABytesConvertable {

    public var carSignature: [UInt8]? {
        return universalPropertyBytes(for: .carSignature)
    }

    public var nonce: [UInt8]? {
        return universalPropertyBytes(for: .nonce)
    }

    public var timestamp: Date? {
        return Date(bytes: universalPropertyBytes(for: .timestamp))
    }


    // MARK: AABytesConvertable

    public var bytes: [UInt8]


    public init?(bytes: [UInt8]) {
        self.bytes = bytes
    }


    // MARK: IteratorProtocol

    public mutating func next() -> AABasicProperty? {
        guard bytes.count >= 3 else {
            return nil
        }

        guard let propertiesSize = UInt16(bytes: bytes[1...2])?.int else {
            return nil
        }

        let size = 3 + propertiesSize

        guard bytes.count >= size else {
            return nil
        }

        guard let property = AABasicProperty(bytes: bytes[..<size].bytes) else {
            return nil
        }

        bytes.removeFirst(size)

        return property
    }
}

extension AAProperties {

    func allOrNil<R>(forIdentifier identifier: AAPropertyIdentifier) -> [AAProperty<R>]? {
        let all = filter {
            $0.identifier == identifier
        }.compactMap {
            return AAProperty<R>(bytes: $0.bytes)
        }

        return all.isEmpty ? nil : all
    }

    func property<R>(forIdentifier identifier: AAPropertyIdentifier) -> AAProperty<R>? {
        return allOrNil(forIdentifier: identifier)?.first
    }
}

private extension AAProperties {

    func universalPropertyBytes(for identifer: AAUniversalPropertyType) -> [UInt8]? {
        return first { $0.identifier == identifer.rawValue }?.valueBytes
    }
}
