//
//  ContentView.swift
//  H4X0R News SwiftUI
//
//  Created by Dovydas Dorofejevas on 26/11/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @StateObject var networkManager = NetworkManager()
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \StashedPost.dateAdded, order: .reverse)
    private var stashedPosts: [StashedPost]
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(networkManager.posts) { post in
                PostRowView(post: post) {
                    // long press → stash
                    if !stashedPosts.contains(where: { $0.hnID == post.objectID }) {
                        let stashed = StashedPost(from: post)
                        modelContext.insert(stashed)
                        // autosave is on by default, so this is persisted :contentReference[oaicite:4]{index=4}
                    }
                }
                .onTapGesture {
                    path.append(post)
                }
            }
            .navigationTitle("H4cK3r News")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink {
                        StashedView()   // we’ll make it fetch via @Query
                    } label: {
                        HStack {
                            Text("Stashed News")
                            if !stashedPosts.isEmpty {
                                Text("\(stashedPosts.count)")
                                    .font(.caption)
                                    .padding(6)
                                    .background(Color.violet)
                                    .foregroundStyle(.white)
                                    .clipShape(Circle())
                                    .transition(.scale)
                            }
                        }
                        .animation(.spring(), value: stashedPosts.count)
                    }
                }
            }
            .navigationDestination(for: Post.self) { post in
                DetailView(url: post.url)
            }
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
