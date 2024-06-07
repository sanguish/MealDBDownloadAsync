//
//  EndpointRequestType.swift
//  iHangry
//
//  Created by Scott Anguish on 5/2/24.
//

import Foundation

/// The `EndpointRequestType` is used to create a `URLRequest` for a specific endpoint interaction.
enum EndpointRequestType {
    case categories

    func urlRequest() -> URLRequest {

        let headers = [
            "accept": "application/json",
        ]
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "themealdb.com"
        let queryItemsArray: [URLQueryItem] = []

        switch self {
        case .categories:
            urlComponents.path = "/api/json/v1/1/categories.php"
        }
        urlComponents.queryItems = queryItemsArray
        var request = URLRequest(url: urlComponents.url!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        return request
    }
}
