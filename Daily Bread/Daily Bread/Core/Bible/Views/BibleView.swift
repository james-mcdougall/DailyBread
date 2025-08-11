//
//  BibleView.swift
//  Daily Bread
//
//  Created by James McDougall on 8/8/25.
//

import SwiftUI

struct BibleView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: BibleViewModel
    @State private var showActionButtons: Bool = false
    
    var body: some View {
        ZStack {
            Color(colorScheme == .light ? .dailyBreadTan : .black)
                .ignoresSafeArea()
            VStack {
                NavigationStack {
                    ZStack(alignment: .top) {
                        Color(colorScheme == .light ? .dailyBreadTan : .black)
                            .ignoresSafeArea()
                        
                        //Scripture
                        ScrollView {
                            VStack(alignment: .leading, spacing: 8) {
                                if let chapter = viewModel.currentChapter {
                                    Text("\(chapter.book.name) \(chapter.chapter.number)")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding(.bottom, 10)
                                    
                                    ForEach(chapter.verses) { verse in
                                        Text("\(verse.number) \(verse.text)")
                                            .font(.body)
                                            .padding(.vertical, 2)
                                    }
                                } else {
                                    ProgressView("Loading Scripture...")
                                }
                            }
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                            .padding()
                            .offset(y: 75)
                        }
                        
                        
                        //View Controls
                        VStack {
                            HStack {
                                
                                NavigationLink {
                                    BibleVersionView()
                                        .navigationBarBackButtonHidden(true)
                                } label: {
                                    Text("Version")
                                        .fontWeight(.bold)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Text("Isaiah 53")
                                        .fontWeight(.bold)
                                }
                                
                                NavigationLink {
                                    
                                } label: {
                                    Text("NLT")
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
            }
        }
        .task {
            do {
                viewModel.bibleVersions = try await viewModel.fetchScriptureVersions()
                try await viewModel.fetchChapter(book: "psalms", chapter: 23)
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
}

#Preview {
    BibleView()
        .environmentObject(BibleViewModel())
}
