//
// AutoAPITests
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
//  AACapabilityTests.swift
//  AutoAPITests
//
//  Created by Mikk Rätsep on 08/04/2019.
//  Copyright © 2019 High Mobility GmbH. All rights reserved.
//

@testable import AutoAPI
import HMUtilities
import XCTest


class AACapabilityTests: XCTestCase {

    static var allTests = [("testDebugTree", testDebugTree)]


    // MARK: XCTestCase

    func testDebugTree() {
        // Vehicle Status
        let hex1 = "00110101001401001131484D39394533413348323532384633310200040100010003000301000004000C0100094261746D6F62696C6505000C010009422D484D2D3837373007000501000207E308000301000009000501000200000A0004010001040B0004010001040C0007010004000000000D000501000200000E0004010001000F000401000100100004010001001100070100046E61766912000A010007506F72736368659900E10100DE002301020005010002001E03000B0100083FE999999999999A040007010004BF19999A050007010004BF19999A060007010004000000000700070100040000000008000B0100083FF000000000000009000501000200000A0007010004000000000B0004010001000C0004010001000E000701000441C800000F00040100010110000401000100110006010003000F16130006010003000F161400070100044219999A15000C01000900000001669BAF11A915000C01000901000001669BAF11A915000C01000902000001669BAF11A91600040100010017000401000100990059010056005301010004010001010200040100010005000501000200150500050100020115060005010002002506000501000201250700050100020011070005010002011108000401000119090004010001370A0004010001E499007001006D00240101000701000441B800000200070100044190000003000701000441B8000004000701000441B0000006000401000100070004010001000800040100010009000701000441B80000050004010001000B00060100030508000B00060100030608000C000701000441B0000099002B0100280062010100040100010002000401000100030005010002000004000401000100050005010002000099011E01011B00610101000501000200000100050100020100010005010002020001000501000203000100050100020400010005010002050001000501000206000100050100020700010005010002080001000501000209000100050100020A000100050100020B000100050100020C000100050100020D000100050100020E000100050100020F0001000501000210000100050100021100010005010002120001000501000213000100050100021400010005010002150001000501000216000100050100021700010005010002180001000501000219000100050100021A000100050100021B000100050100021C000100050100021D000100050100021E000100050100021F000100050100022000010005010002210001000501000222009900F60100F3003301010006010003000BB8030005010002000006000501000200C8090004010001000D000501000200000E000501000200001000040100010015000B0100083FC999999999999A16000B0100083FB999999999999A170005010002000019000C010009000A000000000000001A000801000500401333331A000801000501401333331A000801000502401333331A000801000503401333331B000801000500422000001B000801000501422000001B000801000502422000001B000801000503422000001C00060100030000001C00060100030100001C00060100030200001C00060100030300001D00070100040000000099007E01007B0020010200050100020000020005010002010002000501000202000200050100020300020005010002050003000501000200000300050100020100030005010002020003000501000203000300050100020500040005010002000004000501000201000400050100020200040005010002030004000501000205009900140100110035010100040100010002000401000100990014010011004001020004010001000300040100010099000D01000A0026010100040100010099000D01000A0067010100040100010099001A010017005401010007010004461C4000020007010004447A000099006B01006800360101000401000100020004010001000400060100030000FF05000401000100060004010001000700050100020000070005010002010008000501000200000800050100020100080005010002020008000501000203000900050100020000090005010002010099002501002200340101000501000201900200060100030075300A000B010008000001669BAF11A999000D01000A00660101000401000100990047010044003101070013010010404A421CDE5D1809402AC37D41743E96020028010025416C6578616E646572706C61747A2C203130313738204265726C696E2C204765726D616E7999001C010019005201010005010002000002000B010008000000000000000099000D01000A005801010004010001009900350100320047010100040100010002000301000003000301000004000B010008000001692F55843005000B010008000001692F5584319900C60100C3005701010008010005000000000001000801000501000000000100080100050200000000010008010005030000000002000B010008000000000000000003000B010008000000000000000004000B010008000000000000000005000401000100060007010004000000000700070100040000000008000401000100090004010001000A000501000200000A000501000201000B0004010001000C0004010001000D000B01000800000000000000000E0004010001000F0004010001001200040100010099003001002D00250101000B010008000000000000000002000B010008000000000000000004000401000100050004010001009900460100430056010200050100020000020005010002010002000501000202000200050100020300030005010002000003000501000201000300050100020200030005010002030099000D01000A0046010100040100010099001401001100500101000B010008000001692F5584339900140100110021010100040100010102000401000100990105010102006801010005010002012C020005010002012C03000B0100083FE000000000000004000B0100083FE000000000000005000C010009003FD999999999999A05000C010009013FD999999999999A05000C010009023FD999999999999A05000C010009033FD999999999999A05000C010009043FD999999999999A060008010005004204CCCD060008010005014204CCCD060008010005024204CCCD060008010005034204CCCD060008010005044204CCCD07000701000442CA999A08000701000441B400000900060100030175900A000B0100083FC999999999999A0B000701000440B5C28F0C000B0100083FE00000000000000D000B010008000001669BAF11A999000D01000A00280101000401000100990038010035003001040013010010404A421CDE5D1809402AC37D41743E9605000B010008404A428F9F44D44506000B0100084060B0000000000099001401001100550101000B010008000000000000000099002101001E00590101000401000100020004010001000300030100000400040100010099007901007600450102000C01000900000000000000000002000C01000901000000000000000002000C01000902000000000000000002000C01000903000000000000000002000C010009040000000000000000030005010002000003000501000201000300050100020200030005010002030003000501000204009900140100110042010100040100010002000401000100A2000B01000800000169FCDC392B"

        // Capabilities
        let hex2 = "0010010100080100050020000112010008010005002100011201000901000600230001121301000D01000A0024000112131415161701000801000500250001120100090100060026000112130100090100060027000112040100080100050028000112010006010003002912010007010004003000010100080100050031000112"

        // Lights-Colour
        let hex3 = "0036010100040100010202000401000101040006010003 FF0000 0500040100010006000401000100070005010002000007000501000201010800050100020000080005010002010109000501000200000900050100020100"

        // This is insane to test...
        XCTAssertNotNil(AutoAPI.parseBinary(hex1.hexBytes)?.debugTree.stringValue)
        XCTAssertNotNil(AutoAPI.parseBinary(hex2.hexBytes)?.debugTree.stringValue)
        XCTAssertNotNil(AutoAPI.parseBinary(hex3.hexBytes)?.debugTree.stringValue)
    }
}
