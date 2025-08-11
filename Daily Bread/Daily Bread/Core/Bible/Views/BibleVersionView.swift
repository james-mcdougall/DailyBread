//
//  BibleVersionView.swift
//  Daily Bread
//
//  Created by James McDougall on 8/10/25.
//

import SwiftUI

struct BibleVersionView: View {
    @EnvironmentObject var bibleViewModel: BibleViewModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(colorScheme == .light ? .dailyBreadTan : .black)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(bibleViewModel.bibleVersions) { version in
                        VStack(alignment: .leading) {
                            Text(version.version)
                                .font(.headline)
                            Text(version.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Divider()
                    }
                    .padding(.vertical, 3)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                    }
                }
            }
        }
    }
}

#Preview {
    BibleVersionView()
        .environmentObject(BibleViewModel())
}
