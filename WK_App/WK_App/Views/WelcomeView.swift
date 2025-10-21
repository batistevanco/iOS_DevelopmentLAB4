//
//  WelcomeView.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 15/10/2025.
//

import SwiftUI


struct WelcomeView: View {
    @Environment(WKDataStore.self) var wkDataStore
    @Binding var selectedTeam: String?

    var body: some View {
        
        Text("WK QATAR 2020").font(Font.largeTitle)
        
        Text("Select your favorite team...")
        
        let teams = wkDataStore.getAllTeams()

        List(teams, id: \.self, selection: $selectedTeam) { team in
            Text(team)
        }
        
        if let selectedTeam = selectedTeam{
            Button("Next"){
                ResultsView()
            }

        }

        
    }
}

