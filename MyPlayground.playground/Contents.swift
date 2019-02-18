import Foundation
import AutoAPI
import HMUtilities


let hex = "003301010006010003000bb802000501000200120300050100020000040005010002000005000b0100083fe999999999999a06000501000200c8090004010001000b0007010004414000000c0007010004000000000d000501000200000e000501000200000f00070100040000000010000401000100110005010002001712000701000441c00000130007010004441600001400040100010015000b0100083fc999999999999a16000b0100083fb999999999999a170005010002000018000b0100083fe999999999999a19000c010009000a000000000000001a000801000500401333331a000801000501401333331a000801000502401333331a000801000503401333331b000801000500422000001b000801000501422000001b000801000502422000001b000801000503422000001c00060100030000001c00060100030100001c00060100030200001c00060100030300001d0007010004000000001e000701000400000bb8a2000b01000800000168ec7f76ff"
let bytes = hex.hexBytes

let capability = AAAutoAPI.parseBinary(bytes)

if let diagnostics = capability as? AADiagnostics {
    print("batteryLevel:", diagnostics.batteryLevel ?? "nil")
    print("batteryVoltage:", diagnostics.batteryVoltage ?? "nil")
    print("estimatedRange:", diagnostics.estimatedRange ?? "nil")
    print("fuelLevel:", diagnostics.fuelLevel ?? "nil")
    print("mileage:", diagnostics.mileage ?? "nil")
}
else {
    print("smth else")
}
