//
//  Categories.swift
//  iHangry
//
//  Created by Scott Anguish on 5/14/24.
//

import Foundation

class Categories: Codable {
    var categories: [Category] = []

    init() async throws {
        self.categories = try await fetchCategories()
    }

@MainActor
private func fetchCategories() async throws -> [Category] {
    let requestType: EndpointRequestType = .categories
    let retrievedCategories = try await EndpointRequest().downloadAsyncAndDecode(Categories.self, endpointRequest: requestType)
    if let retrievedCategories {
        return retrievedCategories.categories
    } 
    return []
}
}
