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
//  AAAcceleration.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 13/01/2020.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation


/// Acceleration
public struct AAAcceleration: AABytesConvertable, Equatable {

    /// Direction
    public enum Direction: UInt8, AABytesConvertable {
        case longitudinal = 0x00
        case lateral = 0x01
        case frontLateral = 0x02
        case rearLateral = 0x03
    }


    /// Direction
    public let direction: Direction

    /// The accelaration in g-force
    public let gForce: Float


    /// Initialise `AAAcceleration` with parameters.
    ///
    /// - parameters:
    ///   - direction: Direction as `Direction`
    ///   - gForce: The accelaration in g-force as `Float`
    public init(direction: Direction, gForce: Float) {
        var bytes: Array<UInt8> = []
    
        bytes += direction.bytes
        bytes += gForce.bytes
    
        self.bytes = bytes
        self.direction = direction
        self.gForce = gForce
    }


    // MARK: AABytesConvertable
    
    /// `AAAcceleration` bytes
    ///
    /// - returns: Bytes of `AAAcceleration` in `Array<UInt8>`
    public let bytes: Array<UInt8>
    
    
    /// Initialise `AAAcceleration` with bytes.
    ///
    /// - parameters:
    ///   - bytes: Array of bytes in `Array<UInt8>`
    public init?(bytes: Array<UInt8>) {
        guard bytes.count == 5 else {
            return nil
        }
    
        guard let direction = Direction(bytes: bytes[0..<1]),
            let gForce = Float(bytes: bytes[1..<5]) else {
                return nil
        }
    
        self.bytes = bytes
        self.direction = direction
        self.gForce = gForce
    }
}