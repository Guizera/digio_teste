//
//  contentModel.swift
//  digio-teste
//
//  Created by José Alves da Cunha on 13/12/20.
//

import Foundation

struct ContentModel: Codable {
    
    let spotlight: [Spotlight]
    let cash: Cash
    let products: [Product]
}

struct Cash: Codable {
    let descriptionCash: String
    let title: String
    let bannerURL: String
    
    enum CodingKeys: String, CodingKey {
        case title, bannerURL
        case descriptionCash = "description"
    }
}

struct Spotlight: Codable {
    let descriptionSpot: String
    let name: String
    let bannerURL: String
    
    enum CodingKeys: String, CodingKey {
        case name, bannerURL
        case descriptionSpot = "description"
    }
}

struct Product: Codable {
    let description: String
    let name: String
    let imageURL: String
    
    enum Codingkeys: String, CodingKey {
        case name, imageURL
        case description = "description"
    }
}
