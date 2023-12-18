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
}
