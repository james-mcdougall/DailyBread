//
//  ProfileView.swift
//  Daily Bread
//
//  Created by James McDougall on 8/8/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color(colorScheme == .light ? .dailyBreadTan : .black)
                .ignoresSafeArea()
            VStack {
                Text("Profile View")
            }
        }
    }
}

#Preview {
    ProfileView()
}
