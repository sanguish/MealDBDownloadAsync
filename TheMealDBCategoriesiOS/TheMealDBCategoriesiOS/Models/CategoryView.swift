//
//  RecipesView.swift
//  CategoryView
//
//  Created by Scott Anguish on 4/19/24.
//

import SwiftUI

struct CategoryView: View {
    var viewModel = CategoryViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20.0) {
                    ForEach(viewModel.categories) {category in
                        CategoryRowView(category)
                    }
                }
            }.task {
                await viewModel.fetchCategories()
            }
            .padding(.vertical, 20)
        }
        .navigationTitle("Categories")
    }
}

#Preview {
    CategoryView()
        .environment(CategoryViewModel())
}
