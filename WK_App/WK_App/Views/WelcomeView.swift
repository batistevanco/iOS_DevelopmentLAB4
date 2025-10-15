//
//  WelcomeView.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 15/10/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        Text("WK QATAR 2020").font(Font.largeTitle)
        
        Text("Select your favorite team...")
        
        let teams = getAllTeams()

        List(teams, id: \.self) { team in
            Text(team)
        }
          
        
        Button("Next") {
            ScoreListView()
        }
    }
}

#Preview {
    WelcomeView()
}
