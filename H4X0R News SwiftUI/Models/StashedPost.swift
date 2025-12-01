//
//  StashedPost.swift
//  H4X0R News SwiftUI
//
//  Created by Dovydas Dorofejevas on 01/12/2025.
//

import Foundation
import SwiftData

@Model
final class StashedPost {
    @Attribute(.unique) var hnID: String?
    var title: String
    var url: String?
    var points: Int
    var dateAdded: Date

    init(from post: Post, dateAdded: Date = .now) {
        self.hnID = post.objectID             // from the API model
        self.title = post.title
        self.url = post.url
        self.points = post.points
        self.dateAdded = dateAdded
    }
}

