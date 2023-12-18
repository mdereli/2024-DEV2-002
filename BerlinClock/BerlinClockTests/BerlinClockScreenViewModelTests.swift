import XCTest
@testable import BerlinClock

final class BerlinClockScreenViewModelTests: XCTestCase {

    var sut: BerlinClockScreenViewModel!

    override func setUp() {
        sut = BerlinClockScreenViewModel()
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
        XCTAssertFalse(sut.is5HoursBlockHighlighted(for: 1))
    }

    func testIs1HourBlockHighlighted() {
        XCTAssertFalse(sut.is1HourBlockHighlighted(for: 1))
    }
}
