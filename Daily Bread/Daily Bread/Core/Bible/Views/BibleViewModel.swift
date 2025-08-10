//
//  BibleViewModel.swift
//  Daily Bread
//
//  Created by James McDougall on 8/9/25.
//

import SwiftUI

@MainActor
class BibleViewModel: ObservableObject {

    @Published var version = ""
    @Published var book: String = ""
    @Published var chapter: String = ""
    @Published var verse: String = ""
    @Published var versions: [BibleVersion] = []

    init() {
        Task {
            await fetchVersion()
            await fetchVerse()
        }
    }

    func fetchVerse() async {
        do {
            let verseData = try await BibleAPI.fetchVerse(version: version.lowercased().isEmpty ? "kjv" : version.lowercased(),
                                                         book: "gen",
                                                         chapter: 1,
                                                         verse: 1)
            book = verseData.book
            chapter = String(verseData.chapter)
            verse = verseData.text
        } catch {
            print("Verse fetch failed: \(error)")
        }
    }

    func fetchVersion() async {
        do {
            let fetched = try await BibleAPI.fetchVersions()
            versions = fetched
            if let first = fetched.first {
                version = first.abbreviation
            }
        } catch {
            print("Version fetch failed: \(error)")
        }
    }
}
