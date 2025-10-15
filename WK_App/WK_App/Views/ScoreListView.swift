//
//  ScoreListView.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 15/10/2025.
//

import SwiftUI

struct ScoreListView: View {
    var body: some View {
        NavigationStack(path: $presentedParks) {
            List(parks) { park in
                NavigationLink(park.name, value: park)
            }
            .navigationDestination(for: Park.self) { park in
                ParkDetails(park: park)
            }
        }
    }
}

#Preview {
    ScoreListView()
}
