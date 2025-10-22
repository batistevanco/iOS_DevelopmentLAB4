import Foundation
import SwiftUI

@Observable
class WKDataStore {
    let manager = DataManager()

    func getAllTeams() -> [String] {
        let results = manager.results
        
        // Alleen wedstrijden waar group != nil
        let groupResults = results.filter { $0.group != nil }
        
        // Verzamel home- en away-teams
        let teams = groupResults.flatMap { [$0.homeTeam, $0.awayTeam] }
        
        // Verwijder lege of whitespace-only namen, maak uniek en sorteer
        return Array(
            Set(teams.filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty })
        )
        .sorted()
    }

    func getAllLocations() -> [String] {
        let results = manager.results
        let locs = results.map { $0.location }
        return Array(Set(locs)).filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .sorted()
    }

    func getAllResultsbyLocation(location: String?) -> [WKResult] {
        let results = manager.results
        guard let loc = location, !loc.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return results
        }
        return results.filter { $0.location.compare(loc, options: .caseInsensitive) == .orderedSame }
    }

    // --- Datumhelpers voor sort ---
    private let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd HH:mm:ss'Z'"
        f.timeZone = TimeZone(secondsFromGMT: 0)
        f.locale = Locale(identifier: "en_US_POSIX")
        return f
    }()

    func parseDate(_ r: WKResult) -> Date {
        dateFormatter.date(from: r.dateUTC) ?? .distantPast
    }

    func sortByDateAscending(_ lhs: WKResult, _ rhs: WKResult) -> Bool {
        parseDate(lhs) < parseDate(rhs)
    }
}
