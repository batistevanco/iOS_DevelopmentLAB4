//
//  WKDataStore.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 15/10/2025.
//

import Foundation


func getAllTeams() -> [String] {
    // 1. Laad alle resultaten
    let results: [WKResult] = load("WKResultsQatar.json")

    // 2. Combineer alle teams (home + away)
    let allTeams = results.flatMap { [$0.homeTeam, $0.awayTeam] }

    return allTeams
}

func getAllLocations() -> [String] {
    let results: [WKResult] = load("WKResultsQatar.json")
    let locations = results.flatMap { [$0.location] }
    return locations
}

func getAllResultsbyLocation(location: String){
    
}


