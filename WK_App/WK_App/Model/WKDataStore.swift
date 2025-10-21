//
//  WKDataStore.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 15/10/2025.
//

import Foundation

@Observable
class WKDataStore{
    let manager = DataManager()
    // Unieke teamnamen (home + away), geen lege waarden
        func getAllTeams() -> [String] {
            let results = manager.results

            let teams = results
                .flatMap { [$0.homeTeam, $0.awayTeam] }
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                .filter { !$0.isEmpty }

            var seen = Set<String>() // voor case-insensitieve uniekheid
            let unique = teams.filter { seen.insert($0.lowercased()).inserted }

            return unique.sorted()
        }

        // Unieke locaties, geen lege waarden
        func getAllLocations() -> [String] {
            let results = manager.results

            let locs = results
                .map { $0.location }
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                .filter { !$0.isEmpty }

            var seen = Set<String>()
            let unique = locs.filter { seen.insert($0.lowercased()).inserted }

            return unique.sorted()
        }

    func getAllResultsbyLocation(location: String){
        let results = DataManager().results

    }
}






