import XCTest
@testable import BerlinClock

final class BerlinClockScreenViewModelTests: XCTestCase {

    var sut: BerlinClockScreenViewModel!

    override func setUp() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.hour = 18
        components.minute = 48
        let fakeDate = calendar.date(from: components)!
        sut = BerlinClockScreenViewModel(date: fakeDate)
    }

    func testLampInitiallyOff() {
        XCTAssertFalse(sut.isLampOn)
    }

    func testNumberOf5HoursLamps() {
        XCTAssertEqual(sut.numberOf5HoursLamps, 4)
    }

    func testNumberOf1HoursLamps() {
        XCTAssertEqual(sut.numberOf1HourLamps, 4)
    }

    func testNumberOf5MinutesLamps() {
        XCTAssertEqual(sut.numberOf5MinutesLamps, 11)
    }

    func testNumberOf1MinutesLamps() {
        XCTAssertEqual(sut.numberOf1MinuteLamps, 4)
    }

    func testCurentTime() {
        XCTAssertFalse(sut.currentTime.isEmpty)
    }

    func testIs5HoursBlockHighlighted() {
        XCTAssertTrue(sut.is5HoursBlockHighlighted(for: 1)) // 1st block should be highlighted 05h => 18h48
        XCTAssertTrue(sut.is5HoursBlockHighlighted(for: 2)) // 2nd block should be highlighted 10h => 18h48
        XCTAssertTrue(sut.is5HoursBlockHighlighted(for: 3)) // 3rd block should be highlighted 15h => 18h48
        XCTAssertFalse(sut.is5HoursBlockHighlighted(for: 4)) // 4th block should NOT be highlighted 20h => 18h48
    }

    func testIs1HourBlockHighlighted() {
        XCTAssertTrue(sut.is1HourBlockHighlighted(for: 1)) // 1st block should be highlighted 16h => 18h48
        XCTAssertTrue(sut.is1HourBlockHighlighted(for: 2)) // 2nd block should be highlighted 17h => 18h48
        XCTAssertTrue(sut.is1HourBlockHighlighted(for: 3)) // 3rd block should be highlighted 18h => 18h48
        XCTAssertFalse(sut.is1HourBlockHighlighted(for: 4)) // 4th block should NOT be highlighted 19h => 18h48
    }

    func testIs5minutesBlockHighlighted() {
        XCTAssertTrue(sut.is5minutesBlockHighlighted(for: 1)) // 1st block should be highlighted 05' => 18h48
        XCTAssertTrue(sut.is5minutesBlockHighlighted(for: 2)) // 2nd block should be highlighted 10' => 18h48
        XCTAssertTrue(sut.is5minutesBlockHighlighted(for: 3)) // 3rd block should be highlighted 15' => 18h48
        XCTAssertTrue(sut.is5minutesBlockHighlighted(for: 4)) // 4th block should be highlighted 20' => 18h48
        XCTAssertTrue(sut.is5minutesBlockHighlighted(for: 5)) // 5th block should be highlighted 25' => 18h48
        XCTAssertTrue(sut.is5minutesBlockHighlighted(for: 6)) // 6th block should be highlighted 30' => 18h48
        XCTAssertTrue(sut.is5minutesBlockHighlighted(for: 7)) // 7th block should be highlighted 35' => 18h48
        XCTAssertTrue(sut.is5minutesBlockHighlighted(for: 8)) // 8th block should be highlighted 40' => 18h48
        XCTAssertTrue(sut.is5minutesBlockHighlighted(for: 9)) // 9th block should be highlighted 45' => 18h48
        XCTAssertFalse(sut.is5minutesBlockHighlighted(for: 10)) // 10th block should NOT be highlighted 50' => 18h48
        XCTAssertFalse(sut.is5minutesBlockHighlighted(for: 11)) // 11th block should NOT be highlighted 55' => 18h48
    }

    func testIs1minuteBlockHighlighted() {
        XCTAssertTrue(sut.is1minuteBlockHighlighted(for: 1)) // 1st block should be highlighted 46' => 18h48
        XCTAssertTrue(sut.is1minuteBlockHighlighted(for: 2)) // 2nd block should be highlighted 47' => 18h48
        XCTAssertTrue(sut.is1minuteBlockHighlighted(for: 3)) // 3rd block should be highlighted 48' => 18h48
        XCTAssertFalse(sut.is1minuteBlockHighlighted(for: 4)) // 4th block should NOT be highlighted 49' => 18h48
    }
}
