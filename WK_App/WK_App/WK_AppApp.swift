//
//  WK_AppApp.swift
//  WK_App
//
//  Created by Batiste Vancoillie on 14/10/2025.
//

import SwiftUI

@main
struct WK_AppApp: App {
    @State var wkDataStore = WKDataStore()

    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(wkDataStore)
        }
    }
}
