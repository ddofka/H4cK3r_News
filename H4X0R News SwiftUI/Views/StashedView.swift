//
//  DetailView.swift
//  H4X0R News SwiftUI
//
//  Created by Dovydas Dorofejevas on 26/11/2025.
//

import SwiftUI
import SwiftData

struct StashedView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \StashedPost.dateAdded, order: .reverse)
    private var stashedPosts: [StashedPost]
    
    var body: some View {
        List {
            ForEach(stashedPosts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    Text(post.title)
                }
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("Stashed News")
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(stashedPosts[index])
        }
    }
}

#Preview {
    StashedView()
        .modelContainer(for: StashedPost.self, inMemory: true)
}


