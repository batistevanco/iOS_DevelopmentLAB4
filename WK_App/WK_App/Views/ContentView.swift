import SwiftUI

struct ContentView: View {
    @State private var selectedTeam: String?
    @State private var selectedLocation: String?
    @State private var selectedWKResult: WKResult?

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                WelcomeView(selectedTeam: $selectedTeam)

                if selectedTeam != nil {
                    NavigationLink("Next") {
                        ResultsView(
                            selectedLocation: $selectedLocation,
                            selectedWKResult: $selectedWKResult,
                            selectedTeam: selectedTeam
                        )
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle("Welcome")
        }
    }
}
