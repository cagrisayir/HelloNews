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
            Color(Color.white)
            VStack(alignment: .leading, spacing: 0) {
                AsyncImage(url: URL(string: artic.urlToImage ?? "No-image")) { image in
                    image
                        .resizable()
                        .scaledToFill()

                } placeholder: {
                    Image(systemName: "network")
                        .imageScale(.large)
                }
                .padding(.bottom, 5)
                VStack(alignment: .leading) {
                    Text(artic.title ?? "No News title")
                        .lineLimit(4)
                        .foregroundColor(.primary)
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
