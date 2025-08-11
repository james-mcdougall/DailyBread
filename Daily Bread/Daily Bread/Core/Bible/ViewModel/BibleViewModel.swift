//
//  BibleViewModel.swift
//  Daily Bread
//
//  Created by James McDougall on 8/9/25.
//

import Foundation
import SwiftUI

final class BibleViewModel: ObservableObject {
    
    @Published var bibleVersions: [BibleVersion] = []
    @Published var currentChapter: ChapterResponse?
    
    init() {
        Task {
            try await fetchScriptureVersions()
        }
    }
    
    func fetchScriptureVersions() async throws -> [BibleVersion] {
        let endpoint = "https://cdn.jsdelivr.net/gh/wldeh/bible-api/bibles/bibles.json"
        guard let url = URL(string: endpoint) else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidURL
        }
        
        do {
            let decoder = JSONDecoder()
            var versions = try decoder.decode([BibleVersion].self, from: data)
            versions.sort { $0.version.localizedCaseInsensitiveCompare($1.version) == .orderedAscending }
            DispatchQueue.main.async {
                self.bibleVersions = versions
            }
            return versions
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    func fetchChapter(book: String, chapter: Int) async throws {
        let endpoint = "https://cdn.jsdelivr.net/gh/wldeh/bible-api/bibles/en-asv/books/\(book)/chapters/\(chapter).json"
            guard let url = URL(string: endpoint) else { throw URLError(.badURL) }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let chapterData = try decoder.decode(ChapterResponse.self, from: data)
            
            await MainActor.run {
                self.currentChapter = chapterData
            }
        }
}
