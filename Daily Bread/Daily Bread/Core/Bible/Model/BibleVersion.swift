//
//  BibleVersion.swift
//  Daily Bread
//
//  Created by James McDougall on 8/10/25.
//

import Foundation
import SwiftUI

struct BibleVersion: Codable, Identifiable, Hashable {
    let id: String
    let version: String
    let description: String
    let scope: String
    let language: Language
    let country: Country
    let numeralSystem: String
    let script: String
    let archivist: String
    let copyright: String
    let localVersionName: String
    let localVersionAbbreviation: String
}

// MARK: - Nested Types

struct Language: Codable, Hashable {
    let name: String
    let code: String
    let level: String
}

struct Country: Codable, Hashable {
    let name: String
    let code: String
}
