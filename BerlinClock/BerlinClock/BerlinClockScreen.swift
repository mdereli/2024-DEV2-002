import SwiftUI

struct BerlinClockScreen: View {

    @ObservedObject var viewModel: BerlinClockScreenViewModel

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
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
