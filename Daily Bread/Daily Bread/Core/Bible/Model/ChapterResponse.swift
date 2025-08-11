//
//  ChapterResponse.swift
//  Daily Bread
//
//  Created by James McDougall on 8/10/25.
//

import Foundation

struct ChapterResponse: Codable {
    let book: Book
    let chapter: Chapter
    let verses: [Verse]
}

struct Book: Codable {
    let id: String
    let name: String
}

struct Chapter: Codable {
    let id: String
    let number: Int
}

struct Verse: Codable, Identifiable {
    let id: String
    let number: Int
    let text: String
}

