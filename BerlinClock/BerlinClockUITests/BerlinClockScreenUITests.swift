//
//  BerlinClockScreenUITests.swift
//  BerlinClockUITests
//
//  Created by Mikail Dereli on 19/12/2023.
//

import XCTest

final class BerlinClockScreenUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testLampCircle() {
        let lamp = app.otherElements["lamp"]
        XCTAssertTrue(lamp.exists)
        XCTAssertEqual(lamp.frame.size.width, 51) // frame + lineWidth
        XCTAssertEqual(lamp.frame.size.height, 51) // frame + lineWidth
    }

    func test5HoursBlock() {
        let fiveHoursBlock = app.otherElements.matching(identifier: "fiveHoursBlock").firstMatch
        XCTAssertTrue(fiveHoursBlock.exists)
        XCTAssertEqual(fiveHoursBlock.frame.size.height, 41) // rectangleFrame frame + lineWidth
    }

    func test1HourBlock() {
        let oneHourBlock = app.otherElements.matching(identifier: "oneHourBlock").firstMatch
        XCTAssertTrue(oneHourBlock.exists)
        XCTAssertEqual(oneHourBlock.frame.size.height, 41) // rectangleFrame frame + lineWidth
    }

    func test5MinutesBlock() {
        let fiveMinutesBlock = app.otherElements.matching(identifier: "fiveMinutesBlock").firstMatch
        XCTAssertTrue(fiveMinutesBlock.exists)
        XCTAssertEqual(fiveMinutesBlock.frame.size.height, 41) // rectangleFrame frame + lineWidth
    }

    func test1MinuteBlock() {
        let oneMinuteBlock = app.otherElements.matching(identifier: "oneMinuteBlock").firstMatch
        XCTAssertTrue(oneMinuteBlock.exists)
        XCTAssertEqual(oneMinuteBlock.frame.size.height, 41) // rectangleFrame frame + lineWidth
    }

    func testCurrentTime() {
        let text = app.staticTexts["currentTime"]
        XCTAssertTrue(text.exists)
        XCTAssertFalse(text.label.isEmpty)
    }
}
