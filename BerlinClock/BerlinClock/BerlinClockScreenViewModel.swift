import Foundation

final class BerlinClockScreenViewModel: ObservableObject {

    @Published var isLampOn: Bool = true

    let numberOf5HoursLamps: Int
    let numberOf1HoursLamps: Int
    let numberOf5MinutesLamps: Int
    let numberOf1MinutesLamps: Int

    init() {
        numberOf5HoursLamps = 10
        numberOf1HoursLamps = 10
        numberOf5MinutesLamps = 10
        numberOf1MinutesLamps = 10
    }

}
