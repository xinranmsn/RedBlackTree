//
//  PermutationTests.swift
//  RedBlackTree
//
//  Created by Károly Lőrentey on 2015-12-21.
//  Copyright © 2015–2016 Károly Lőrentey.
//

import Foundation
import XCTest

class PermutationTests: XCTestCase {
    func testPermutations() {
        XCTAssertEqual(Array(generatePermutations(0)), [])
        XCTAssertEqual(Array(generatePermutations(1)), [[0]])
        XCTAssertEqual(Array(generatePermutations(2)), [[0, 1], [1, 0]])
        XCTAssertEqual(Array(generatePermutations(3)), [[0, 1, 2], [0, 2, 1], [2, 0, 1], [1, 0, 2], [1, 2, 0], [2, 1, 0]])
        var count = 0
        for p in generatePermutations(6) {
            XCTAssertEqual(p.sorted(), [0, 1, 2, 3, 4, 5])
            count += 1
        }
        XCTAssertEqual(count, 6 * 5 * 4 * 3 * 2)
    }

    func testInversions() {
        XCTAssertEqual(Array(generateInversions(0)), [])
        XCTAssertEqual(Array(generateInversions(1)), [[0]])
        XCTAssertEqual(Array(generateInversions(2)), [[0, 0], [0, 1]])
        XCTAssertEqual(Array(generateInversions(3)), [[0, 0, 0], [0, 0, 1], [0, 0, 2], [0, 1, 0], [0, 1, 1], [0, 1, 2]])

        var count = 0
        for inv in generateInversions(6) {
            XCTAssertEqual(inv.enumerated().filter { $0.offset < $0.element }.count, 0)
            count += 1
        }
        XCTAssertEqual(count, 6 * 5 * 4 * 3 * 2)
    }
}