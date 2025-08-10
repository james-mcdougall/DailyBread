//
//  BibleViewModel.swift
//  Daily Bread
//
//  Created by James McDougall on 8/9/25.
//

import SwiftUI

@MainActor
class BibleViewModel: ObservableObject {

    /// Abbreviation of the currently selected Bible version
    @Published var selectedVersion: String = ""
    /// Verse returned from the API
    @Published var currentVerse: BibleAPI.Verse?
    /// Available Bible versions
    @Published var versions: [BibleVersion] = []

    /// Load initial data by fetching the available versions and first verse
    func load() async {
        await fetchVersions()
        await fetchVerse()
    }

    /// Fetch the verse for the currently selected version
    func fetchVerse() async {
        do {
            let verseData = try await BibleAPI.fetchVerse(
                version: selectedVersion.isEmpty ? "kjv" : selectedVersion.lowercased(),
                book: "gen",
                chapter: 1,
                verse: 1
            )
            currentVerse = verseData
        } catch {
            print("Verse fetch failed: \(error)")
        }
    }

    /// Fetch all available Bible versions
    func fetchVersions() async {
        do {
            let fetched = try await BibleAPI.fetchVersions()
            versions = fetched
            if selectedVersion.isEmpty, let first = fetched.first {
                selectedVersion = first.abbreviation
            }
        } catch {
            print("Version fetch failed: \(error)")
        }
    }
}
