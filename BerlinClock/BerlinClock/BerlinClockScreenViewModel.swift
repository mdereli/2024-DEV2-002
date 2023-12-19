import Combine
import Foundation

final class BerlinClockScreenViewModel: ObservableObject {

    @Published var currentTime: String = ""
    @Published var isLampOn: Bool = false

    let numberOf5HoursLamps: Int
    let numberOf1HourLamps: Int
    let numberOf5MinutesLamps: Int
    let numberOf1MinuteLamps: Int

    private let calendar: Calendar
    private let timer: Timer.TimerPublisher

    private var date: Date
    private var timerCancellable = Set<AnyCancellable>()

    init(
        date: Date = Date(),
        calendar: Calendar = Calendar.current,
        timer: Timer.TimerPublisher = Timer.publish(every: Constants.oneSecond, on: .main, in: .common)) {
        self.date = date
        self.timer = timer
        self.calendar = calendar
        numberOf5HoursLamps = Constants.fiveHoursRow
        numberOf1HourLamps = Constants.oneHourRow
        numberOf5MinutesLamps = Constants.fiveMinutesRow
        numberOf1MinuteLamps = Constants.oneMinuteRow

        bindTimer()
        formatCurrentTime()
    }

    func is5HoursBlockHighlighted(for blockPosition: Int) -> Bool {
        guard blockPosition > 0 && blockPosition <= Constants.fiveHoursRow else { return false } // return false if wrong block position

        let hour = calendar.component(.hour, from: date)
        let fiveHoursBlocks = hour / Constants.fiveHours // the division is rounded (ex: 18 / 5 = 3) => 3 blocks of 5 hours

        return fiveHoursBlocks >= blockPosition // check if block position is less or equal to 5hours blocks number
    }

    func is1HourBlockHighlighted(for blockPosition: Int) -> Bool {
        guard blockPosition > 0 && blockPosition <= Constants.oneHourRow else { return false } // return false if wrong block position

        let hour = calendar.component(.hour, from: date)
        let fiveHoursBlocks = hour / Constants.fiveHours
        let oneHourBlocks = hour - (fiveHoursBlocks * Constants.fiveHours) // retrive 5hours blocks from hour (ex: 18h - (3 x 5h) = 3h)

        return oneHourBlocks >= blockPosition // check if block position is less or equal to 1hour blocks number
    }

    func is5minutesBlockHighlighted(for blockPosition: Int) -> (isHighlighted: Bool, isThirdLamp: Bool) {
        guard blockPosition > 0 && blockPosition <= Constants.fiveMinutesRow else { return (false, false) } // return false if wrong block position

        let minute = calendar.component(.minute, from: date)
        let isHighlighted = (blockPosition * Constants.fiveMinutes) <= minute //  check if block position x 5 minutes is less or equal to minutes
        let isThirdLamp = blockPosition % Constants.third == 0 // check if the block position is a multiple of 3

        return (isHighlighted, isThirdLamp)
    }

    func is1minuteBlockHighlighted(for blockPosition: Int) -> Bool {
        guard blockPosition > 0 && blockPosition <= Constants.oneMinuteRow else { return false } // return false if wrong block position

        let minute = calendar.component(.minute, from: date)
        let oneMinuteBlocks = minute % Constants.fiveMinutes

        return blockPosition <= oneMinuteBlocks
    }
}

// MARK: - Bindings
private extension BerlinClockScreenViewModel {

    func bindTimer() {
        timer
            .autoconnect()
            .sink { [weak self] _ in
                self?.date = Date()
                self?.isLampOn.toggle()
                self?.formatCurrentTime()
            }
            .store(in: &timerCancellable)
    }

    func formatCurrentTime() {
        let components = calendar.dateComponents([.hour, .minute], from: date)
        if let hour = components.hour, let minute = components.minute {
            currentTime = String(format: Constants.timeFormat, hour, minute)
        }
    }
}

// MARK: - Constants
private extension BerlinClockScreenViewModel {

    enum Constants {
        static let fiveHoursRow: Int = 4
        static let oneHourRow: Int = 4
        static let fiveMinutesRow: Int = 11
        static let oneMinuteRow: Int = 4
        static let oneSecond: Double = 1.0
        static let fiveHours: Int = 5
        static let fiveMinutes: Int = 5
        static let third: Int = 3
        static let timeFormat: String = "%d:%d"
    }
}
