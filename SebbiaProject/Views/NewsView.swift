//
//  NewsView.swift
//  SebbiaProject
//
//  Created by Евгений Мазурок on 06.04.2024.
//

import SwiftUI
import AttributedText



struct NewsView: View {
    var newsId: Int
    @State private var showFullDescription = false
    @StateObject var news = NewsViewModel()
    var body: some View {
        VStack(alignment:.leading) {
            Text(news.news.title)
                .bold()
            Text(news.news.date)
                .foregroundStyle(.gray)
            Text(news.news.shortDescription)
            Divider()
            if showFullDescription {
                WebView(htmlString : news.news.fullDescription)
            }
        }
        .frame( maxWidth: .infinity, alignment:.leading)
        .font(.title3)
        .multilineTextAlignment(.leading)
        .padding()
        .task {
            do {
                try await news.fetchNews(id: newsId)
            }
            catch {
                print("error")
            }
        }
        .onAppear {
                    showFullDescription = true
                }
    }
}

