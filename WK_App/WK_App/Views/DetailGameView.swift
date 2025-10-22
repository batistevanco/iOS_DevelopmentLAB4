import SwiftUI

struct DetailGameView: View {
    @Binding var selectedWKResult: WKResult?
    var favoriteTeam: String?

    var body: some View {
        if let g = selectedWKResult {
            let fav = favoriteTeam?.lowercased()
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Match \(g.matchNumber)").font(.title2).bold()
                    Text(g.location).font(.headline)

                    HStack(spacing: 8) {
                        Text(g.homeTeam)
                            .foregroundStyle(g.homeTeam.lowercased() == fav ? .red : .primary)
                        Text("vs").foregroundStyle(.secondary)
                        Text(g.awayTeam)
                            .foregroundStyle(g.awayTeam.lowercased() == fav ? .red : .primary)
                    }.font(.title3)

                    HStack(spacing: 6) {
                        Text("\(g.homeTeamScore ?? 0)")
                        Text("-")
                        Text("\(g.awayTeamScore ?? 0)")
                    }
                    .font(.largeTitle)
                    .monospacedDigit()

                    Text("Date (UTC): \(g.dateUTC)")
                        .font(.footnote)
                        .foregroundStyle(.secondary)

                    Spacer()
                }
                .padding()
                scoreDetailView(selectedWKResult: $selectedWKResult)
            }
        } else {
            ContentUnavailableView("No match selected", systemImage: "soccerball")
        }
    }
}
