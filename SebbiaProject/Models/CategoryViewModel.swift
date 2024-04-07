//
//  Category.swift
//  SebbiaProject
//
//  Created by Евгений Мазурок on 05.04.2024.
//

import Foundation
import SwiftUI


class CategoryViewModel: ObservableObject {
    @Published var categoriesList: [NewsCategory] = []
    
     struct ResponseNewsCategory: Decodable {
        let list: [NewsCategory]
    }
    
     struct NewsCategory: Identifiable, Decodable {
        let id: Int
        let name: String
    }

    
    func fetchCategories() async throws {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "http://testtask.sebbia.com/v1/news/categories")!)
            let decodedResponse = try JSONDecoder().decode(ResponseNewsCategory.self, from: data)
            DispatchQueue.main.async {
                self.categoriesList = decodedResponse.list
            }
        } catch {
            print("error: \(error)")
        }
    }
}


