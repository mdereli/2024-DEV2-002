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

    init(date: Date = Date()) {
        self.date = date
        calendar = Calendar.current
        numberOf5HoursLamps = Constants.fiveHoursRow
        numberOf1HourLamps = Constants.oneHourRow
        numberOf5MinutesLamps = Constants.fiveMinutesRow
        numberOf1MinuteLamps = Constants.oneMinuteRow
        timer = Timer.publish(every: Constants.oneSecond, on: .main, in: .common)

        bindTimer()
        formatCurrentTime()
    }

    func is5HoursBlockHighlighted(for blockPosition: Int) -> Bool {
        let hour = calendar.component(.hour, from: date)
        let fiveHoursBlocks = (hour % Constants.hoursInDay) / Constants.fiveHours

        return fiveHoursBlocks >= blockPosition
    }

    func is1HourBlockHighlighted(for blockPosition: Int) -> Bool {
        let hour = calendar.component(.hour, from: date)
        let fiveHoursBlocks = (hour % Constants.hoursInDay) / Constants.fiveHours
        let oneHourBlocks = hour - (fiveHoursBlocks * Constants.fiveHours)

        return oneHourBlocks >= blockPosition
    }

    func is5minutesBlockHighlighted(for blockPosition: Int) -> (isHighlighted: Bool, isThirdLamp: Bool) {
        let minute = calendar.component(.minute, from: date)
        let isHighlighted = (blockPosition * Constants.fiveHours) <= minute
        let isThirdLamp = blockPosition % Constants.third == 0

        return (isHighlighted, isThirdLamp)
    }

    func is1minuteBlockHighlighted(for blockPosition: Int) -> Bool {
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
        static let hoursInDay: Int = 24
        static let fiveHours: Int = 5
        static let fiveMinutes: Int = 5
        static let third: Int = 3
        static let timeFormat: String = "%02d:%02d"
    }
}
