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
        VStack(alignment: .leading, spacing: 12) {
            Text("WK QATAR 2022").font(.largeTitle)
            Text("Select your favorite team...")

            let teams = wkDataStore.getAllTeams()
            List(teams, id: \.self, selection: $selectedTeam) { team in
                Text(team)
            }
        }
        .padding(.horizontal)
    }
}

