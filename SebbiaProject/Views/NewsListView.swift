//
//  NewsListView.swift
//  SebbiaProject
//
//  Created by Евгений Мазурок on 06.04.2024.
//

import SwiftUI

struct NewsListView: View {
    var categoryId: Int
    @StateObject var news = NewsListViewModel()
    @State private var currentPage = 0

    var body: some View {
        VStack {
            ScrollView {
                ForEach(news.newsList) { newsItem in
                    NewsInListView(news: newsItem)
                    
                }
            }
            Button("Загрузить еще", action: fetchNextPage)
                .padding()
        }
        .task {
            do {
                news.newsList.removeAll()
                try await news.fetchNewsList(id: categoryId, page: currentPage)
            } catch {
                print("Error: \(error)")
            }
        }
    }

    private func fetchNextPage() {
        currentPage += 1
        Task {
            do {
                try await news.fetchNewsList(id: categoryId, page: currentPage)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
