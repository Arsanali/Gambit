//
//  Product.swift
//  Gambit
//
//  Created by arsik on 20.10.2020.
//

import Foundation

struct Product: Decodable {
    let id: Int?
    let name: String?
    let image: String?
    let price: String?
    let description: String?
    let isFavorite: Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case image = "image"
        case price = "price"
        case description = "description"
        case isFavorite = "isFavorite"
    }
}
