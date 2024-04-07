//
//  ContentView.swift
//  SebbiaProject
//
//  Created by Евгений Мазурок on 05.04.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var newsViewModel = CategoryViewModel()
    var body: some View {
        VStack {
            VStack{
                Text("MyApp 4 Sebbia")
                    .font(.title)
                Text("Pls choose a category")
                    .font(.title2)
                   
            }
            .bold()
            ScrollView{
                LazyVGrid(columns:[GridItem(.flexible()), GridItem(.flexible())]){
                    ForEach(newsViewModel.categoriesList) { category in
                        CategoryView(category: category)
                    }
                }
            }
            .padding(.top)
            Spacer()
        }
        .padding()
        .task {
            do {
                try await newsViewModel.fetchCategories()
            }
            catch {
                print("Ошибка")
            }
        }
    }
}

#Preview {
    ContentView()
}
