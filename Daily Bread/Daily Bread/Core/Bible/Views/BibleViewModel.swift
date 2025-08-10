//
//  BibleViewModel.swift
//  Daily Bread
//
//  Created by James McDougall on 8/9/25.
//

import SwiftUI

class BibleViewModel: ObservableObject {
    
    @Published var version = ""
    @Published var book: String = ""
    @Published var chapter: String = ""
    @Published var verse: String = ""
    
    
    init() {
        fetchBook()
        fetchChapter()
        fetchVerse()
        fetchVersion()
    }
    
    func fetchBook() {
        self.book = "Genesis"
    }
    
    func fetchChapter() {
        self.chapter = "1"
    }
    
    func fetchVerse() {
        let urlString = "https://cdn.jsdelivr.net/gh/wldeh/bible-api/bibles/bibles.json"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            print("Did receive data: \(data)")
            
            guard let data = data else { return }
            print(data)
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) else { return }
            print("JSON \(jsonObject)")
        }
        .resume()
        self.verse = "12"
    }
    
    func fetchVersion() {
        self.version = "KJV"
    }
}
