//
//  Category.swift
//  iHangry
//
//  Created by Scott Anguish on 5/14/24.
//

import Foundation

class Category: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let thumbnailURL: URL
    let description: String

    init(id: String, name: String, thumbnailURL: URL, description: String) {
        self.id = id
        self.name = name
        self.thumbnailURL = thumbnailURL
        self.description = description
    }

    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnailURL = "strCategoryThumb"
        case description = "strCategoryDescription"
    }

    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.thumbnailURL == rhs.thumbnailURL &&
        lhs.description == rhs.description
    }


}
