//
//  CategoryViewModel.swift
//  Mealtime
//
//  Created by Scott Anguish on 4/22/24.
//

import Foundation

@Observable
class CategoryViewModel {
    var categories: [Category] = []

    @MainActor
    func fetchCategories() async {
        do {
            let categories = try await Categories()
            self.categories = categories.categories
        } catch let error as NSError {
            print("Provide proper user feedback \(error.localizedDescription)")
        }
    }

    init() {
        Task {
            await fetchCategories()
        }
    }
}
