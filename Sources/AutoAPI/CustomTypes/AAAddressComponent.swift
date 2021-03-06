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
//  AAAddressComponent.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAAddressComponent: Codable, HMBytesConvertable {

    public typealias TypeOf = AAAddressComponentType


    /// Component type.
    public var type: TypeOf

    /// Value for the component.
    public var value: String


    /// Initialise `AAAddressComponent` with arguments.
    ///
    /// - parameters:
    ///     - type: Component type.
    ///     - value: Value for the component.
    public init(type: TypeOf, value: String) {
        self.bytes = [type.bytes, value.bytes.sizeBytes(amount: 2), value.bytes].flatMap { $0 }
        self.type = type
        self.value = value
    }


    // MARK: HMBytesConvertable
    
    public let bytes: [UInt8]
    
    
    /// Initialise `AAAddressComponent` with bytes.
    ///
    /// - parameters:
    ///     - bytes: Bytes array in `[UInt8]`.
    public required init?(bytes: [UInt8]) {
        guard bytes.count >= 1 else {
            return nil
        }
    
        guard let type = TypeOf(bytes: bytes[0..<1].bytes),
    		  let value = bytes.extract(stringFrom: 1) else {
            return nil
        }
    
        self.bytes = bytes
        self.type = type
        self.value = value
    }
}
