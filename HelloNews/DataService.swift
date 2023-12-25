//
//  DataService.swift
//  HelloNews
//
//  Created by Omer Cagri Sayir on 25.12.2023.
//

import Foundation

struct DataService {
    func apiCall(country: String) async -> [Article] {
        // 1. URL
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=ca4f7514ad3048bebfb2ef9f682752b0") {
            // 2. URLRequest
            let request = URLRequest(url: url)

            // 3. URLSession
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(Response.self, from: data)
                    return result.articles
                } catch {
                    print("Parsing Error", error)
                }

            } catch {
                print(error)
            }
        }
        return [Article]()
    }
}
