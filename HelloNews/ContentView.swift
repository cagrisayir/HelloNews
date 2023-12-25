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
        ZStack {
            Color(Color.brown)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    ForEach(news, id: \.title) { artic in
                        NavigationLink {
                            SingleNewsView(article: artic)
                        } label: {
                            NewsCard(artic: artic)
                        }
                    }
                    .task {
                        news = await dataService.apiCall()
                    }
                    .navigationTitle("Hello News")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
