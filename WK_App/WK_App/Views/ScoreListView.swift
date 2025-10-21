//
//  ScoreListView.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 15/10/2025.
//

import SwiftUI

struct ScoreListView: View {
    @Environment(WKDataStore.self) var wkDataStore
       @State private var selectedLocation: String? = "Lusail Stadium"

       private var resultsAtLocation: [WKResult] {
           guard let loc = selectedLocation?
               .trimmingCharacters(in: .whitespacesAndNewlines),
                 !loc.isEmpty
           else {
               return []
           }

           return wkDataStore.getAllResultsbyLocation(location: loc)
       }
    
    var body: some View {
        //results by location
        Grid {
            GridRow {
                Text("Team")
                Text("X")
                Text("Team")
            }
            GridRow {
                Text("Score")
                Text("-")
                Text("Score")
            }
        }

    }
}

