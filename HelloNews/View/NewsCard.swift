//
//  NewsCard.swift
//  HelloNews
//
//  Created by Omer Cagri Sayir on 25.12.2023.
//

import SwiftUI

struct NewsCard: View {
    let artic: Article
    var body: some View {
        ZStack {
            Color(Color(red: 224 / 255, green: 225 / 255, blue: 221 / 255))
            VStack(alignment: .leading, spacing: 0) {
                if artic.urlToImage == nil {
                    Image("news_placeholder")
                        .resizable()
                        .scaledToFit()

                } else {
                    AsyncImage(url: URL(string: artic.urlToImage!)) { image in
                        image
                            .resizable()
                            .scaledToFill()

                    } placeholder: {
                        Image(systemName: "globe")
                    }
                    .padding(.bottom, 5)
                }
                VStack(alignment: .leading) {
                    Text(artic.title ?? "No News title")
                        .lineLimit(4)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .bold()

                    Link("read in source", destination: URL(string: artic.url ?? "www.cagrisayir.dev")!)
                }
                .padding()
            }
        }
        .cornerRadius(20)
        .padding()
    }
}
