//
//  DetailView.swift
//  H4X0R News SwiftUI
//
//  Created by Dovydas Dorofejevas on 26/11/2025.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url).edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}



