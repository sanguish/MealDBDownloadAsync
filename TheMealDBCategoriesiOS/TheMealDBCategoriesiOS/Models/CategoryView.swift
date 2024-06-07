//
//  RecipesView.swift
//  CategoryView
//
//  Created by Scott Anguish on 4/19/24.
//

import SwiftUI

@ViewBuilder
private func rowView(category: Category, proxy: GeometryProxy) -> some View {

    AsyncImage(url: category.thumbnailURL) { phase in
        if let image = phase.image {
            VStack {
                image
                    .resizable()
                    .padding(40)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .clipped()
            }
        } else if phase.error != nil {
            Image(systemName: "exclamationmark.octagon.fill")
                .foregroundStyle(Color.red)
        } else {
            ProgressView()
        }

    }
    Group {
        Text(category.name)
            .font(.title)
            .fontDesign(.rounded)
        Text(category.description)
            .font(.body)
    }
    .padding(.horizontal, 30)
}


struct CategoryView: View {
    var viewModel = CategoryViewModel()
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .center) {
                        ForEach(viewModel.categories) {category in
                            rowView(category: category, proxy: proxy)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CategoryView()
        .environment(CategoryViewModel())
}
