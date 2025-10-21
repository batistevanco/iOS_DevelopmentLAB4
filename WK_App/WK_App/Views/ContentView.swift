//
//  ContentView.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTeam: String?
    var body: some View {
       /* NavigationSplitView{
            WelcomeView(selectedTeam: $selectedTeam)
        } detail: {
            if let selectedTeam = selectedTeam{
                ScoreListView(selectedTeam: selectedTeam)
            } else{
                Text("Please select a name")
            }
        }*/
        NavigationStack{
            WelcomeView(selectedTeam: $selectedTeam)
        }
    }
}

#Preview {
    ContentView()
}
