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
//  AATime.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 13/01/2020.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation


/// Time
public struct AATime: AABytesConvertable, Equatable {

    /// Value between 0 and 23
    public let hour: UInt8

    /// Value between 0 and 59
    public let minute: UInt8


    /// Initialise `AATime` with parameters.
    ///
    /// - parameters:
    ///   - hour: Value between 0 and 23 as `UInt8`
    ///   - minute: Value between 0 and 59 as `UInt8`
    public init(hour: UInt8, minute: UInt8) {
        var bytes: Array<UInt8> = []
    
        bytes += hour.bytes
        bytes += minute.bytes
    
        self.bytes = bytes
        self.hour = hour
        self.minute = minute
    }


    // MARK: AABytesConvertable
    
    /// `AATime` bytes
    ///
    /// - returns: Bytes of `AATime` in `Array<UInt8>`
    public let bytes: Array<UInt8>
    
    
    /// Initialise `AATime` with bytes.
    ///
    /// - parameters:
    ///   - bytes: Array of bytes in `Array<UInt8>`
    public init?(bytes: Array<UInt8>) {
        guard bytes.count == 2 else {
            return nil
        }
    
        guard let hour = UInt8(bytes: bytes[0..<1]),
            let minute = UInt8(bytes: bytes[1..<2]) else {
                return nil
        }
    
        self.bytes = bytes
        self.hour = hour
        self.minute = minute
    }
}