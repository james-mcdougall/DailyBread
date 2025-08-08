//
//  TabBarView.swift
//  Daily Bread
//
//  Created by James McDougall on 8/8/25.
//

import SwiftUI

struct TabBarView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "house" : "house.fill")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Home")
                    }
                }
                .tag(0)
            
            BibleView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 1 ? "book.pages" : "book.pages.fill")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Bible")
                    }
                }
                .tag(1)
            
            DevotionalView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 2 ? "hands.and.sparkles" : "hands.and.sparkles.fill")
                            .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                        Text("Devotional")
                    }
                }
                .tag(2)
            
            SeekView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 3 ? "magnifyingglass" : "magnifyingglass")
                            .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                        Text("Seek")
                    }
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 4 ? "person" : "person.fill")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("Profile")
                    }
                }
                .tag(4)
        }
        .tint(.primary)
    }
}

#Preview {
    TabBarView()
}
