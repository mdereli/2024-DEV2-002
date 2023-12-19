import Foundation

final class BerlinClockScreenViewModel: ObservableObject {

    @Published var currentTime: String = ""
    @Published var isLampOn: Bool = true

    let numberOf5HoursLamps: Int
    let numberOf1HourLamps: Int
    let numberOf5MinutesLamps: Int
    let numberOf1MinuteLamps: Int

    private let date: Date
    private let timer: Timer.TimerPublisher

    init(date: Date = Date()) {
        self.date = date
        numberOf5HoursLamps = 10
        numberOf1HourLamps = 10
        numberOf5MinutesLamps = 10
        numberOf1MinuteLamps = 10
        timer = Timer.publish(every: 1, on: .main, in: .common)

        formatCurrentTime()
    }

    func is5HoursBlockHighlighted(for blockPosition: Int) -> Bool {
        return false
    }

    func is1HourBlockHighlighted(for blockPosition: Int) -> Bool {
        return false
    }

    func is5minutesBlockHighlighted(for blockPosition: Int) -> Bool {
        return false
    }

    func is1minuteBlockHighlighted(for blockPosition: Int) -> Bool {
        return false
    }
}

private extension BerlinClockScreenViewModel {
    func formatCurrentTime() {
        currentTime = ""
    }
}
