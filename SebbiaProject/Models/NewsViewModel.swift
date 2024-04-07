//
//  NewsViewModel.swift
//  SebbiaProject
//
//  Created by Евгений Мазурок on 06.04.2024.
//

import Foundation


class NewsViewModel: ObservableObject {
    @Published var news: News = News(id: 0, title: "String", date: "String", shortDescription: "String", fullDescription: "String")
    
    struct ResponseNews: Decodable {
       let news: News
   }
    
    struct News: Identifiable, Decodable {
        let id: Int
        let title: String
        let date: String
        let shortDescription: String
        let fullDescription: String
    }

    
    func fetchNews(id:Int) async throws {
        print(id)
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "http://testtask.sebbia.com/v1/news/details?id=\(id)")!)
            print(data)
            let decodedResponse = try JSONDecoder().decode(ResponseNews.self, from: data)
            print(decodedResponse)
            DispatchQueue.main.async {
                self.news = decodedResponse.news
            }
        } catch {
            print("error: \(error)")
        }
    }
}


