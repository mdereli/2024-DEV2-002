import SwiftUI

struct BerlinClockScreen: View {

    @ObservedObject var viewModel: BerlinClockScreenViewModel

    var body: some View {
        VStack(spacing: Constants.verticalSpacing) {

            // LAMP
            Circle().fill(viewModel.isLampOn ? .yellow : .white)
                .frame(width: Constants.circleFrame, height: Constants.circleFrame)
                .overlay(Circle().stroke(.gray, lineWidth: Constants.lineWidth))
                .accessibility(identifier: AccessibilityIdentifier.lamp)

            // 5 HOURS BLOCK
            HStack(spacing: Constants.horizontalSpacing) {
                Spacer()
                ForEach(1..<viewModel.numberOf5HoursLamps + 1, id: \.self) { index in
                    hoursBlock(isHighlighted: viewModel.is5HoursBlockHighlighted(for: index))
                }
                Spacer()
            }
            .accessibility(identifier: AccessibilityIdentifier.fiveHoursBlock)

            // 1 HOUR BLOCK
            HStack(spacing: Constants.horizontalSpacing) {
                Spacer()
                ForEach(1..<viewModel.numberOf1HourLamps + 1, id: \.self) { index in
                    hoursBlock(isHighlighted: viewModel.is1HourBlockHighlighted(for: index))
                }
                Spacer()
            }
            .accessibility(identifier: AccessibilityIdentifier.oneHourBlock)

            // 5 Minutes BLOCK
            HStack(spacing: Constants.horizontalSpacing) {
                Spacer()
                ForEach(1..<viewModel.numberOf5MinutesLamps + 1, id: \.self) { index in
                    let isHighlighted = viewModel.is5minutesBlockHighlighted(for: index).isHighlighted
                    let isThirdLamp = viewModel.is5minutesBlockHighlighted(for: index).isThirdLamp
                    minutesBlock(isHighlighted: isHighlighted, isThirdLamp: isThirdLamp)
                }
                Spacer()
            }
            .accessibility(identifier: AccessibilityIdentifier.fiveMinutesBlock)

            // 1 Minute BLOCK
            HStack(spacing: Constants.horizontalSpacing) {
                Spacer()
                ForEach(1..<viewModel.numberOf1MinuteLamps + 1, id: \.self) { index in
                    minutesBlock(isHighlighted: viewModel.is1minuteBlockHighlighted(for: index))
                }
                Spacer()
            }
            .accessibility(identifier: AccessibilityIdentifier.oneMinuteBlock)

            Text(viewModel.currentTime)
                .font(.title)
                .foregroundColor(.primary)
                .accessibility(identifier: AccessibilityIdentifier.currentTime)
            Spacer()
        }
        .padding()
    }

    @ViewBuilder
    func hoursBlock(isHighlighted: Bool) -> some View {
        Rectangle()
            .fill(isHighlighted ? .red : .white)
            .frame(height: Constants.rectangleFrame)
            .overlay(Rectangle().stroke(.gray, lineWidth: Constants.lineWidth))
    }

    @ViewBuilder
    func minutesBlock(isHighlighted: Bool, isThirdLamp: Bool = false) -> some View {
        Rectangle()
            .fill(isHighlighted ? isThirdLamp ? .red : .yellow : .white)
            .frame(height: Constants.rectangleFrame)
            .overlay(Rectangle().stroke(.gray, lineWidth: Constants.lineWidth))
    }
}

private extension BerlinClockScreen {

    enum Constants {
        static let verticalSpacing: CGFloat = 24
        static let horizontalSpacing: CGFloat = 8
        static let circleFrame: CGFloat = 50
        static let rectangleFrame: CGFloat = 40
        static let lineWidth: CGFloat = 1
    }

    enum AccessibilityIdentifier {
        static let lamp = "lamp"
        static let fiveHoursBlock = "fiveHoursBlock"
        static let oneHourBlock = "oneHourBlock"
        static let fiveMinutesBlock = "fiveMinutesBlock"
        static let oneMinuteBlock = "oneMinuteBlock"
        static let currentTime = "currentTime"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BerlinClockScreen(viewModel: BerlinClockScreenViewModel())
    }
}

#Preview {
    BerlinClockScreen(viewModel: BerlinClockScreenViewModel())
}
