//
//  BibleView.swift
//  Daily Bread
//
//  Created by James McDougall on 8/8/25.
//

import SwiftUI

struct BibleView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = BibleViewModel()
    @State private var showActionButtons: Bool = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(colorScheme == .light ? .dailyBreadTan : .black)
                    .ignoresSafeArea()

                //Scripture
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        if let verse = viewModel.currentVerse {
                            Text(verse.text)
                                .foregroundStyle(colorScheme == .light ? .black : .white)
                                .padding()
                        } else {
                            ProgressView()
                        }
                    }
                    .offset(y: 75)
                }

                //View Controls
                VStack {
                    HStack {
                        Button {

                        } label: {
                            Text("\(viewModel.currentVerse?.book ?? "") \(viewModel.currentVerse?.chapter ?? 0)")
                                .fontWeight(.bold)
                        }

                        Menu {
                            ForEach(viewModel.versions) { version in
                                Button(version.abbreviation) {
                                    Task {
                                        viewModel.selectedVersion = version.abbreviation
                                        await viewModel.fetchVerse()
                                    }
                                }
                            }
                        } label: {
                            Text("\(viewModel.selectedVersion.uppercased())")
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 20) {
                            
                            Button {
                                withAnimation(.spring()) {
                                    showActionButtons.toggle()
                                }
                            } label: {
                                Image(systemName: "keyboard.chevron.compact.down")
                                    .font(.headline)
                                    
                            }
                            
                            NavigationLink {
                                BibleSettingsView()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Image(systemName: "aqi.medium")
                                    .font(.headline)
                                    
                            }
                        }
                        .fontWeight(.semibold)
                    }
                    .font(.body)
                    .foregroundStyle(colorScheme == .light ? .black : .white)
                    .padding()
                    .background(colorScheme == .light ? .dailyBreadTan : .black)
                    
                    Divider()
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        BibleMediaOptionsView()
                            .offset(x: showActionButtons ? 200 : 0)
                            .opacity(showActionButtons ? 0 : 1)
                            .disabled(showActionButtons)
                            .padding(.bottom)
                    }
                }
            }
        }
        .task {
            await viewModel.load()
        }
    }
}

#Preview {
    BibleView()
}
