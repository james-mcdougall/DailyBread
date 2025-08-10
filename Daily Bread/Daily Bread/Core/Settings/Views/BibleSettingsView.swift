//
//  BibleSettingsView.swift
//  Daily Bread
//
//  Created by James McDougall on 8/9/25.
//

import SwiftUI

struct BibleSettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ZStack {
                Color(colorScheme == .light ? .dailyBreadTan : .black)
                    .ignoresSafeArea()
                
                VStack {
                    
                }
            }
            .tint(.primary)
            .navigationTitle("Bible Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //Save action
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                }
            }
            .foregroundStyle(colorScheme == .light ? .black : .white)
        }
    }
}

#Preview {
    BibleView()
}
