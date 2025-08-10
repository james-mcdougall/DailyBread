//
//  BibleMediaOptionsView.swift
//  Daily Bread
//
//  Created by James McDougall on 8/9/25.
//

import SwiftUI

struct BibleMediaOptionsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var actionButtonsTapped: Bool = false
    
    var body: some View {
        ZStack {
            
            Button {
                
            } label: {
                Image(systemName: "video")
                    .foregroundStyle(colorScheme == .light ? .dailyBreadTan : .black)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(20)
                    .background(colorScheme == .light ? .white : .dailyBreadTan)
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
            }
            .padding(.horizontal)
            .offset(x: 0, y: actionButtonsTapped ? -300 : 0)
            
            Button {
                
            } label: {
                Image(systemName: "microphone")
                    .foregroundStyle(colorScheme == .light ? .dailyBreadTan : .black)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(20)
                    .background(colorScheme == .light ? .white : .dailyBreadTan)
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
            }
            .padding(.horizontal)
            .offset(x: 0, y: actionButtonsTapped ? -225 : 0)
            
            Button {
                
            } label: {
                Image(systemName: "pencil.and.scribble")
                    .foregroundStyle(colorScheme == .light ? .dailyBreadTan : .black)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(20)
                    .background(colorScheme == .light ? .white : .dailyBreadTan)
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
            }
            .padding(.horizontal)
            .offset(x: 0, y: actionButtonsTapped ? -150 : 0)
            
            Button {
                
            } label: {
                Image(systemName: "rotate.3d")
                    .foregroundStyle(colorScheme == .light ? .dailyBreadTan : .black)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(20)
                    .background(colorScheme == .light ? .white : .dailyBreadTan)
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
            }
            .padding(.horizontal)
            .offset(x: 0, y: actionButtonsTapped ? -75 : 0)
            
            Button {
                
            } label: {
                Image(systemName: "backward.end.alt.fill")
                    .foregroundStyle(colorScheme == .light ? .dailyBreadTan : .black)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(20)
                    .background(colorScheme == .light ? .white : .dailyBreadTan)
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
            }
            .padding(.horizontal)
            .offset(x: actionButtonsTapped ? -225 : 0, y: 0)
            
            Button {
                
            } label: {
                Image(systemName: "play.fill")
                    .foregroundStyle(colorScheme == .light ? .dailyBreadTan : .black)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(20)
                    .background(colorScheme == .light ? .white : .dailyBreadTan)
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
            }
            .padding(.horizontal)
            .offset(x: actionButtonsTapped ? -150 : 0, y: 0)
            
            Button {
                
            } label: {
                Image(systemName: "forward.end.alt.fill")
                    .foregroundStyle(colorScheme == .light ? .dailyBreadTan : .black)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(20)
                    .background(colorScheme == .light ? .white : .dailyBreadTan)
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
            }
            .padding(.horizontal)
            .offset(x: actionButtonsTapped ? -75 : 0, y: 0)
            
            Button {
                withAnimation(.spring()) {
                    actionButtonsTapped.toggle()
                }
            } label: {
                if actionButtonsTapped {
                    Image(systemName: "xmark")
                        .foregroundStyle(colorScheme == .light ? .dailyBreadTan : .black)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(20)
                        .background(colorScheme == .light ? .white : .dailyBreadTan)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 5, x: 2, y: 2)
                } else {
                    Image(systemName: "plus")
                        .foregroundStyle(colorScheme == .light ? .dailyBreadTan : .black)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(20)
                        .background(colorScheme == .light ? .white : .dailyBreadTan)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 5, x: 2, y: 2)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    BibleMediaOptionsView()
}
