//
//  Response.swift
//  HelloNews
//
//  Created by Omer Cagri Sayir on 25.12.2023.
//

import Foundation

struct Response: Decodable {
    var status: String
    var totalResult: Int?
    var articles: [Article]
}
