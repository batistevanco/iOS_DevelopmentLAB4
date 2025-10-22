import SwiftUI

struct ScoreListView: View {
    @Environment(WKDataStore.self) var wkDataStore
    var selectedLocation: String?
    var selectedTeam: String?
    @Binding var selectedWKResult: WKResult?

    var scores: [WKResult] {
        wkDataStore
            .getAllResultsbyLocation(location: selectedLocation)
            .sorted(by: wkDataStore.sortByDateAscending)
    }

    var body: some View {
        if let location = selectedLocation {
            // favoriet team genormaliseerd
            let fav = selectedTeam?
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()

            List(scores, id: \.self, selection: $selectedWKResult) { score in
                // teamnamen genormaliseerd voor vergelijking
                let home = score.homeTeam.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                let away = score.awayTeam.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(score.homeTeam)
                            .foregroundStyle(home == fav ? .red : .primary)
                        Text("vs")
                            .foregroundStyle(.secondary)
                        Text(score.awayTeam)
                            .foregroundStyle(away == fav ? .red : .primary)
                    }
                    .font(.headline)

                    HStack(spacing: 6) {
                        Text("\(score.homeTeamScore ?? 0)")
                        Text("-")
                        Text("\(score.awayTeamScore ?? 0)")
                    }
                    .font(.title3)
                    .monospacedDigit()
                }
                .padding(.vertical, 4)
            }
            .navigationTitle(location)
        } else {
            // Geen stadion gekozen
            ContentUnavailableView("No stadium selected", systemImage: "soccerball")
        }
    }
}
