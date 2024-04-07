//
//  NewsInListView.swift
//  SebbiaProject
//
//  Created by Евгений Мазурок on 06.04.2024.
//

import SwiftUI

struct NewsInListView: View {
    var news: NewsListViewModel.NewsInList
    var body: some View {
        NavigationLink(destination: NewsView(newsId: news.id)) {
            VStack(alignment:.leading) {
                Text(news.title)
                    .bold()
                Text(news.date)
                    .foregroundStyle(.gray)
                Text(news.shortDescription)
                    .lineLimit(3)
            }
            .frame(alignment:.leading)
            .font(.title3)
            .multilineTextAlignment(.leading)
            .padding()
        }
        .buttonStyle(PlainButtonStyle())
    }
}

