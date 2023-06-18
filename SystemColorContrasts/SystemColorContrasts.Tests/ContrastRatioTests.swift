//
//  ContrastRatioTests.swift
//  SystemColorContrasts
//
//  Created by Sören Kuklau on 18.06.23.
//

import XCTest

final class ContrastRatioTests: XCTestCase {
    func testContrastRatio() throws {
        let testCases = [
            (a: NSColor(red: 1.0, green: 0, blue: 0, alpha: 0),
             b: NSColor(red: 0, green: 1.0, blue: 0, alpha: 0),
             expectedResult: 2.91),

            (a: NSColor(red: 1.0, green: 0, blue: 0, alpha: 0),
             b: NSColor(red: 0, green: 0, blue: 1.0, alpha: 0),
             expectedResult: 2.15),
            
            (a: NSColor(red: 1.0, green: 0.58, blue: 0, alpha: 0),
             b: NSColor(red: 0, green: 0.47, blue: 0.98, alpha: 0),
             expectedResult: 1.88),
            
            (a: NSColor(red: 77 / 255, green: 77 / 255, blue: 77 / 255, alpha: 0),
             b: NSColor(red: 237 / 255, green: 237 / 255, blue: 237 / 255, alpha: 0),
             expectedResult: 7.22),
            
            (a: NSColor(red: 0, green: 0, blue: 0, alpha: 0),
             b: NSColor(red: 1, green: 1, blue: 1, alpha: 0),
             expectedResult: 21)
        ]

        for (a, b, expectedResult) in testCases {
            XCTContext.runActivity(named: "Contrast from \(a) to \(b) should be \(expectedResult)") {
                activity in
                XCTAssertEqual(expectedResult, a.contrastRatio(to: b), accuracy: 0.01)
            }
        }
    }
}
