//
//  Article.swift
//  HelloNews
//
//  Created by Omer Cagri Sayir on 25.12.2023.
//

import Foundation

struct Article {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source {
    var id: String?
    var name: String?
}
