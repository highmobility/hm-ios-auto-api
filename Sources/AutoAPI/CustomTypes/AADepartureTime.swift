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
//  AADepartureTime.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities



public final class AADepartureTime: Codable, HMBytesConvertable {

    /// Active state.
    public var state: AAActiveState

    /// Time.
    public var time: AATime


    /// Initialise `AADepartureTime` with arguments.
    ///
    /// - parameters:
    ///     - state: Active state.
    ///     - time: Time.
    public init(state: AAActiveState, time: AATime) {
        self.bytes = [state.bytes, time.bytes].flatMap { $0 }
        self.state = state
        self.time = time
    }


    // MARK: HMBytesConvertable
    
    public let bytes: [UInt8]
    
    
    /// Initialise `AADepartureTime` with bytes.
    ///
    /// - parameters:
    ///     - bytes: Bytes array in `[UInt8]`.
    public required init?(bytes: [UInt8]) {
        guard bytes.count == 3 else {
            return nil
        }
    
        guard let state = AAActiveState(bytes: bytes[0..<1].bytes),
    		  let time = AATime(bytes: bytes[1..<3].bytes) else {
            return nil
        }
    
        self.bytes = bytes
        self.state = state
        self.time = time
    }
}