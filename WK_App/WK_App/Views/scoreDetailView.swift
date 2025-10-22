//
//  scoreDetailView.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 22/10/2025.
//

import SwiftUI

struct scoreDetailView: View {
    @Binding var selectedWKResult: WKResult?
    
    
    
    var body: some View {
        if let g = selectedWKResult{
            Text("Round: \(g.roundNumber)")
            Text("Group: \(g.group ?? "-")")
        }else {
            ContentUnavailableView("No match selected", systemImage: "soccerball")
        }
    }
}

