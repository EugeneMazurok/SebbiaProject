//
//  NewsListViewModel.swift
//  SebbiaProject
//
//  Created by Евгений Мазурок on 06.04.2024.
//

import Foundation

class NewsListViewModel: ObservableObject {
    @Published var newsList: [NewsInList] = []

    struct ResponseNewsList: Decodable{
        let list: [NewsInList]
    }

    struct NewsInList: Identifiable, Decodable, Equatable{
        let id: Int
        let title: String
        let date: String
        let shortDescription: String
    }

    func fetchNewsList(id: Int, page: Int) async throws {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "http://testtask.sebbia.com/v1/news/categories/\(id)/news?page=\(page)")!)
            let decodedResponse = try JSONDecoder().decode(ResponseNewsList.self, from: data)
            DispatchQueue.main.async {
            
                self.newsList.append(contentsOf: decodedResponse.list)
            }
        } catch {
            print("error: \(error)")
        }
    }
}


