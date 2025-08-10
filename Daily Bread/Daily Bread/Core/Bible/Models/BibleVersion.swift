import Foundation

struct BibleVersion: Decodable, Identifiable {
    let id: String
    let abbreviation: String
    let name: String
    let language: String
}
