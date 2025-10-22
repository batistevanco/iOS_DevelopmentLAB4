//
//  ResultsView.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 21/10/2025.
//

import SwiftUI

struct ResultsView: View {
   
    @Binding var selectedLocation: String?
    @Binding var selectedWKResult: WKResult?
    var selectedTeam: String?
    
    var body: some View {
            NavigationSplitView {
                // Sidebar: locaties
                ListStadionView(selectedLocation: $selectedLocation)
                    .navigationTitle("Stadiums")
            } content: {
                // Midden: matchen (gefilterd op stadion + sort)
                ScoreListView(
                    selectedLocation: selectedLocation,
                    selectedTeam: selectedTeam,
                    selectedWKResult: $selectedWKResult
                )
                .navigationTitle(selectedLocation ?? "Matches")
            } detail: {
                // Detail: geselecteerde match
                DetailGameView(
                    selectedWKResult: $selectedWKResult,
                    favoriteTeam: selectedTeam
                )
            }
        }
}

