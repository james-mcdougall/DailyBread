import Foundation

enum BibleAPI {
    static let baseURL = URL(string: "https://cdn.jsdelivr.net/gh/wldeh/bible-api/")!

    static func fetchVersions() async throws -> [BibleVersion] {
        let url = baseURL.appendingPathComponent("bibles/bibles.json")
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([BibleVersion].self, from: data)
    }

    struct Verse: Decodable {
        let book: String
        let chapter: Int
        let verse: Int
        let text: String
    }

    static func fetchVerse(version: String, book: String, chapter: Int, verse: Int) async throws -> Verse {
        let url = baseURL.appendingPathComponent("bibles/\(version)/books/\(book)/chapters/\(chapter)/verses/\(verse).json")
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Verse.self, from: data)
    }
}
