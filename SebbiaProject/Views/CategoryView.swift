//
//  CategoryView.swift
//  SebbiaProject
//
//  Created by Евгений Мазурок on 06.04.2024.
//

import SwiftUI

struct CategoryView: View {
    var category: CategoryViewModel.NewsCategory
    var body: some View {
        NavigationLink(destination: NewsListView(categoryId: category.id)){
            Text("\(category.name)")
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 3)
                    
                )
        }
        
    }
}
