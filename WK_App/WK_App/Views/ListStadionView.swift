//
//  ListStadionView.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 15/10/2025.
//

import SwiftUI

struct ListStadionView: View {
    
    @Environment(WKDataStore.self) var wkDataStore
    
    let locations = wkDataStore.getAllLocations()
    
    var body: some View {
       //alle locaties tonen
    }
}

