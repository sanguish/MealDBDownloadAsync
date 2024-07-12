//
//  CategoryRowView.swift
//  TheMealDBCategoriesiOS
//
//  Created by Scott Anguish on 7/12/24.
//

import SwiftUI

struct CategoryRowView: View {
    let category: Category

    init(_ category: Category) {
        self.category = category
    }

    var body: some View {
        HStack {
            AsyncImage(url: category.thumbnailURL) { phase in
                if let image = phase.image {
                    VStack {
                        image
                            .resizable()
                            .padding(20)
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
            .frame(width: 320 / 2.0, height: 200 / 2.0)

            VStack(alignment: .leading) {
                Text(category.name)
                    .font(.title)
                    .fontDesign(.rounded)
                Text(category.description)
                    .font(.body)
            }
            .foregroundStyle(Color.black)
            .padding([.vertical, .trailing], 20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.97, opacity: 1.0))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 2)
        .padding(.horizontal, 30)
    }
}
