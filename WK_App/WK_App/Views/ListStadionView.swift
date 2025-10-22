//
//  ListStadionView.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 15/10/2025.
//

import SwiftUI

struct ListStadionView: View {
    
    @Environment(WKDataStore.self) var wkDataStore
    @Binding var selectedLocation: String?
    
    var body: some View {
            let locations = wkDataStore.getAllLocations()
            List(locations, id: \.self, selection: Binding(
                get: { selectedLocation },
                set: { newValue in
                    // bij wissel stadion reset detailselectie in parent (via ResultsView/ContentView)
                    selectedLocation = newValue
                }
            )) { loc in
                Text(loc)
            }
        }
}

