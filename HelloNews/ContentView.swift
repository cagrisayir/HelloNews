//
//  ContentView.swift
//  HelloNews
//
//  Created by Omer Cagri Sayir on 25.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var news = [Article]()
    var dataService = DataService()
    var body: some View {
        List(news, id: \.title) { artic in
            Text(artic.title ?? "NEWS")
        }
        .task {
            news = await dataService.apiCall()
        }
    }
}

#Preview {
    ContentView()
}
