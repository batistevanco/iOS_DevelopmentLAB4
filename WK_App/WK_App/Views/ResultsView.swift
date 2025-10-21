//
//  ResultsView.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 21/10/2025.
//

import SwiftUI

struct ResultsView: View {
   

    
        var body: some View {
        NavigationSplitView {
            ListStadionView()
            
        } content: {
            ScoreListView()
        }
        detail: {
            DetailGameView()
        }
    }
}

