//
//  SingleNewsView.swift
//  HelloNews
//
//  Created by Omer Cagri Sayir on 25.12.2023.
//

import SwiftUI

struct SingleNewsView: View {
    var article = Article()
    var body: some View {
        VStack(alignment: .leading) {
            if article.urlToImage == nil {
                Image("news_placeholder")
                    .resizable()
                    .frame(height: 300)
                    .cornerRadius(15)
            } else {
                AsyncImage(url: URL(string: article.urlToImage!)) { image in
                    image
                        .resizable()
                        .frame(height: 300)
                        .cornerRadius(15)
                } placeholder: {
                    Image(systemName: "network")
                }
            }
            ScrollView {
                VStack {
                    Text(article.title ?? "TITLE")
                        .font(.title)
                        .foregroundStyle(.primary)
                        .fontWeight(.bold)
                        .bold()
                        .padding(.bottom)

                    Text(article.content ?? "There is no content")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding(20)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SingleNewsView()
}
