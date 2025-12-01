//
//  PostData.swift
//  H4X0R News SwiftUI
//
//  Created by Dovydas Dorofejevas on 26/11/2025.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable, Hashable {
    var id: String {
        return objectID
    }
    let points: Int
    let title: String
    let url: String?
    let objectID: String
}
