//
//  ContentView.swift
//  HelloNews
//
//  Created by Omer Cagri Sayir on 25.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var news = [Article]()
    enum Countries: String, CaseIterable, Identifiable {
        case tr, us
        var id: Self { self }
    }

    @State private var selectedCountry: Countries = .us
    var dataService = DataService()
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 13/255, green: 27/266, blue: 42/266), Color(red: 119/255, green: 141/255, blue: 169/255)], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            VStack {
                Picker("Select Country", selection: $selectedCountry) {
                    Text("Turkiye").tag(Countries.tr)
                    Text("USA").tag(Countries.us)
                }
                .pickerStyle(.segmented)
                .onChange(of: selectedCountry) {
                    Task {
                        news = await dataService.apiCall(country: selectedCountry.rawValue)
                    }
                }
                ScrollView {
                    ForEach(news, id: \.title) { artic in
                        NavigationLink {
                            SingleNewsView(article: artic)
                        } label: {
                            NewsCard(artic: artic)
                        }
                    }
                    .task {
                        news = await dataService.apiCall(country: selectedCountry == .tr ? "tr" : "us")
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
