//
//  NetworkError.swift
//  Daily Bread
//
//  Created by James McDougall on 8/10/25.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case noInternet
    case invalidURL
    case invalidData
}
