//
//  Daily_BreadApp.swift
//  Daily Bread
//
//  Created by James McDougall on 8/8/25.
//

import SwiftUI

@main
struct Daily_BreadApp: App {
    @StateObject var bibleViewModel = BibleViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bibleViewModel)
        }
    }
}
