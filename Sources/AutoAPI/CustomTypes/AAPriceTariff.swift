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
//  AAPriceTariff.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAPriceTariff: Codable, HMBytesConvertable {

    /// PricingType enum.
    public enum PricingType: String, CaseIterable, Codable, HMBytesConvertable {
    
        case startingFee = "startingFee"
        case perMinute = "perMinute"
        case perKwh = "perKwh"
    
    
        public var byteValue: UInt8 {
            switch self {
            case .startingFee: return 0x00
            case .perMinute: return 0x01
            case .perKwh: return 0x02
            }
        }
    
    
        // MARK: HMBytesConvertable
    
        public var bytes: [UInt8] {
            [byteValue]
        }
    
    
        public init?(bytes: [UInt8]) {
            guard let uint8 = UInt8(bytes: bytes) else {
                return nil
            }
    
            switch uint8 {
            case 0x00: self = .startingFee
            case 0x01: self = .perMinute
            case 0x02: self = .perKwh
            default: return nil
            }
        }
    }


    /// PricingType.
    public var pricingType: PricingType

    /// The price.
    public var price: Double

    /// The currency alphabetic code per ISO 4217 or crypto currency symbol.
    public var currency: String


    /// Initialise `AAPriceTariff` with arguments.
    ///
    /// - parameters:
    ///     - pricingType: PricingType.
    ///     - price: The price.
    ///     - currency: The currency alphabetic code per ISO 4217 or crypto currency symbol.
    public init(pricingType: PricingType, price: Double, currency: String) {
        self.bytes = [pricingType.bytes, price.bytes, currency.bytes.sizeBytes(amount: 2), currency.bytes].flatMap { $0 }
        self.pricingType = pricingType
        self.price = price
        self.currency = currency
    }


    // MARK: HMBytesConvertable
    
    public let bytes: [UInt8]
    
    
    /// Initialise `AAPriceTariff` with bytes.
    ///
    /// - parameters:
    ///     - bytes: Bytes array in `[UInt8]`.
    public required init?(bytes: [UInt8]) {
        guard bytes.count >= 9 else {
            return nil
        }
    
        guard let pricingType = PricingType(bytes: bytes[0..<1].bytes),
    		  let price = Double(bytes: bytes[1..<9].bytes),
    		  let currency = bytes.extract(stringFrom: 9) else {
            return nil
        }
    
        self.bytes = bytes
        self.pricingType = pricingType
        self.price = price
        self.currency = currency
    }
}