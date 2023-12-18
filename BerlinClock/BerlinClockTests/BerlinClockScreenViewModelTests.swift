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
        XCTAssertEqual(sut.numberOf1HoursLamps, 4)
    }

    func testNumberOf5MinutesLamps() {
        XCTAssertEqual(sut.numberOf5MinutesLamps, 11)
    }

    func testNumberOf1MinutesLamps() {
        XCTAssertEqual(sut.numberOf1MinutesLamps, 4)
    }
}