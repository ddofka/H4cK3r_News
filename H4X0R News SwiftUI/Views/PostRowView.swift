//
//  PostRowView.swift
//  H4X0R News SwiftUI
//
//  Created by Dovydas Dorofejevas on 01/12/2025.
//

import SwiftUI

struct PostRowView: View {
    let post: Post
    let onLongPress: () -> Void
    
    @State private var isPopping = false
    
    var body: some View {
        HStack {
            Text(String(post.points))
            Text(post.title)
        }
        .frame(maxWidth: .infinity, alignment: .leading)   // take full row width
        .contentShape(Rectangle())                         // whole row is hit-testable
        .scaleEffect(isPopping ? 1.1 : 1.0)
        .animation(.spring(response: 0.2,
                           dampingFraction: 0.6),
                   value: isPopping)
        .onLongPressGesture(minimumDuration: 0.5) {
            // 1) Haptic feedback
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            onLongPress()
            
            // local pop animation
            isPopping = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isPopping = false
            }
        }
    }
}


