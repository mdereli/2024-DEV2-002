import SwiftUI

@main
struct BerlinClockApp: App {
    var body: some Scene {
        WindowGroup {
            BerlinClockScreen(viewModel: BerlinClockScreenViewModel())
        }
    }
}
