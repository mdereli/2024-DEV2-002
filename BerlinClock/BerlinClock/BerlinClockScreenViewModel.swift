import Foundation

final class BerlinClockScreenViewModel: ObservableObject {

    @Published var currentTime: String = ""
    @Published var isLampOn: Bool = true

    let numberOf5HoursLamps: Int
    let numberOf1HourLamps: Int
    let numberOf5MinutesLamps: Int
    let numberOf1MinuteLamps: Int

    init() {
        numberOf5HoursLamps = 10
        numberOf1HourLamps = 10
        numberOf5MinutesLamps = 10
        numberOf1MinuteLamps = 10
    }

    func is5HoursBlockHighlighted(for blockPosition: Int) -> Bool {
        return true
    }

    func is1HourBlockHighlighted(for blockPosition: Int) -> Bool {
        return true
    }
}
